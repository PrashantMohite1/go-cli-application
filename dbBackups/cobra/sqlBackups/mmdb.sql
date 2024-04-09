PGDMP                 	        |            mmdb    12.4 (Debian 12.4-1.pgdg100+1) %   14.11 (Ubuntu 14.11-0ubuntu0.22.04.1) �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    mmdb    DATABASE     X   CREATE DATABASE mmdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE mmdb;
                keycloak    false            �            1259    16435    useraccountid_seq1    SEQUENCE     �   CREATE SEQUENCE public.useraccountid_seq1
    START WITH 100001
    INCREMENT BY 1
    MINVALUE 100000
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.useraccountid_seq1;
       public          keycloak    false                       1259    16825    account    TABLE       CREATE TABLE public.account (
    accountid integer DEFAULT nextval('public.useraccountid_seq1'::regclass) NOT NULL,
    userid integer,
    orgid integer,
    accountname character varying NOT NULL,
    accounttype character varying NOT NULL,
    plantype character varying NOT NULL,
    gstno character varying,
    status character varying,
    createddate timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    lastinvoicegenerateddate timestamp with time zone,
    lastpaymentdate timestamp with time zone
);
    DROP TABLE public.account;
       public         heap    keycloak    false    227            �            1259    16433    account_seq1    SEQUENCE     u   CREATE SEQUENCE public.account_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.account_seq1;
       public          keycloak    false            �            1259    16447    accountsubscriptions_seq1    SEQUENCE     �   CREATE SEQUENCE public.accountsubscriptions_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.accountsubscriptions_seq1;
       public          keycloak    false                        1259    16770    accountsubscriptions    TABLE     �  CREATE TABLE public.accountsubscriptions (
    accountsubscriptionsid integer DEFAULT nextval('public.accountsubscriptions_seq1'::regclass) NOT NULL,
    accountid integer NOT NULL,
    subscriptionid integer NOT NULL,
    assigneddate timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    validuntiltime timestamp without time zone NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 (   DROP TABLE public.accountsubscriptions;
       public         heap    keycloak    false    233            3           1259    17547    admin_event_entity    TABLE     �  CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);
 &   DROP TABLE public.admin_event_entity;
       public         heap    keycloak    false            P           1259    18008    associated_policy    TABLE     �   CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);
 %   DROP TABLE public.associated_policy;
       public         heap    keycloak    false            6           1259    17565    authentication_execution    TABLE     �  CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);
 ,   DROP TABLE public.authentication_execution;
       public         heap    keycloak    false            5           1259    17559    authentication_flow    TABLE     t  CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.authentication_flow;
       public         heap    keycloak    false            4           1259    17553    authenticator_config    TABLE     �   CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);
 (   DROP TABLE public.authenticator_config;
       public         heap    keycloak    false            7           1259    17570    authenticator_config_entry    TABLE     �   CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 .   DROP TABLE public.authenticator_config_entry;
       public         heap    keycloak    false            Q           1259    18023    broker_link    TABLE     L  CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);
    DROP TABLE public.broker_link;
       public         heap    keycloak    false                       1259    16902    client    TABLE     �  CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);
    DROP TABLE public.client;
       public         heap    keycloak    false            #           1259    17276    client_attributes    TABLE     �   CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 %   DROP TABLE public.client_attributes;
       public         heap    keycloak    false            \           1259    18283    client_auth_flow_bindings    TABLE     �   CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_auth_flow_bindings;
       public         heap    keycloak    false            [           1259    18157    client_initial_access    TABLE     �   CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);
 )   DROP TABLE public.client_initial_access;
       public         heap    keycloak    false            %           1259    17288    client_node_registrations    TABLE     �   CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_node_registrations;
       public         heap    keycloak    false            E           1259    17807    client_scope    TABLE     �   CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);
     DROP TABLE public.client_scope;
       public         heap    keycloak    false            F           1259    17822    client_scope_attributes    TABLE     �   CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);
 +   DROP TABLE public.client_scope_attributes;
       public         heap    keycloak    false            ]           1259    18325    client_scope_client    TABLE     �   CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.client_scope_client;
       public         heap    keycloak    false            G           1259    17828    client_scope_role_mapping    TABLE     �   CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 -   DROP TABLE public.client_scope_role_mapping;
       public         heap    keycloak    false                       1259    16914    client_session    TABLE     �  CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);
 "   DROP TABLE public.client_session;
       public         heap    keycloak    false            :           1259    17591    client_session_auth_status    TABLE     �   CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_auth_status;
       public         heap    keycloak    false            $           1259    17282    client_session_note    TABLE     �   CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_note;
       public         heap    keycloak    false            2           1259    17469    client_session_prot_mapper    TABLE     �   CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_prot_mapper;
       public         heap    keycloak    false                       1259    16920    client_session_role    TABLE     �   CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_role;
       public         heap    keycloak    false            ;           1259    17672    client_user_session_note    TABLE     �   CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);
 ,   DROP TABLE public.client_user_session_note;
       public         heap    keycloak    false            Y           1259    18073 	   component    TABLE     )  CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);
    DROP TABLE public.component;
       public         heap    keycloak    false            X           1259    18067    component_config    TABLE     �   CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);
 $   DROP TABLE public.component_config;
       public         heap    keycloak    false                       1259    16923    composite_role    TABLE     �   CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);
 "   DROP TABLE public.composite_role;
       public         heap    keycloak    false                       1259    16926 
   credential    TABLE     $  CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
    DROP TABLE public.credential;
       public         heap    keycloak    false                       1259    16893    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 %   DROP TABLE public.databasechangelog;
       public         heap    keycloak    false            
           1259    16888    databasechangeloglock    TABLE     �   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap    keycloak    false            �            1259    16441    datareport_seq1    SEQUENCE     x   CREATE SEQUENCE public.datareport_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.datareport_seq1;
       public          keycloak    false                       1259    16856 
   datareport    TABLE       CREATE TABLE public.datareport (
    reportid integer DEFAULT nextval('public.datareport_seq1'::regclass) NOT NULL,
    username character varying,
    orgname character varying,
    status boolean DEFAULT false,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.datareport;
       public         heap    keycloak    false    230            ^           1259    18341    default_client_scope    TABLE     �   CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.default_client_scope;
       public         heap    keycloak    false                       1259    16932    event_entity    TABLE     �  CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);
     DROP TABLE public.event_entity;
       public         heap    keycloak    false            �            1259    16413 	   event_seq    SEQUENCE     r   CREATE SEQUENCE public.event_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.event_seq;
       public          keycloak    false            �            1259    16439    favouriteresource_seq1    SEQUENCE        CREATE SEQUENCE public.favouriteresource_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.favouriteresource_seq1;
       public          keycloak    false            �            1259    16538    favouriteresource    TABLE     �   CREATE TABLE public.favouriteresource (
    favresourceid integer DEFAULT nextval('public.favouriteresource_seq1'::regclass) NOT NULL,
    username character varying,
    orgname character varying,
    resourceid integer
);
 %   DROP TABLE public.favouriteresource;
       public         heap    keycloak    false    229            R           1259    18029    fed_user_attribute    TABLE     (  CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);
 &   DROP TABLE public.fed_user_attribute;
       public         heap    keycloak    false            S           1259    18035    fed_user_consent    TABLE     �  CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
 $   DROP TABLE public.fed_user_consent;
       public         heap    keycloak    false            `           1259    18367    fed_user_consent_cl_scope    TABLE     �   CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.fed_user_consent_cl_scope;
       public         heap    keycloak    false            T           1259    18044    fed_user_credential    TABLE     �  CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
 '   DROP TABLE public.fed_user_credential;
       public         heap    keycloak    false            U           1259    18054    fed_user_group_membership    TABLE     �   CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 -   DROP TABLE public.fed_user_group_membership;
       public         heap    keycloak    false            V           1259    18057    fed_user_required_action    TABLE       CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 ,   DROP TABLE public.fed_user_required_action;
       public         heap    keycloak    false            W           1259    18064    fed_user_role_mapping    TABLE     �   CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 )   DROP TABLE public.fed_user_role_mapping;
       public         heap    keycloak    false            (           1259    17326    federated_identity    TABLE       CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);
 &   DROP TABLE public.federated_identity;
       public         heap    keycloak    false            Z           1259    18133    federated_user    TABLE     �   CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);
 "   DROP TABLE public.federated_user;
       public         heap    keycloak    false            �            1259    16389 	   group_seq    SEQUENCE     r   CREATE SEQUENCE public.group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.group_seq;
       public          keycloak    false            �            1259    16478    group    TABLE     q  CREATE TABLE public."group" (
    groupid integer DEFAULT nextval('public.group_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    orgid integer NOT NULL,
    userid integer NOT NULL,
    lastupdateuser character varying(100) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."group";
       public         heap    keycloak    false    204            B           1259    17745    group_attribute    TABLE       CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);
 #   DROP TABLE public.group_attribute;
       public         heap    keycloak    false            A           1259    17742    group_role_mapping    TABLE     �   CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 &   DROP TABLE public.group_role_mapping;
       public         heap    keycloak    false            )           1259    17332    identity_provider    TABLE     �  CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.identity_provider;
       public         heap    keycloak    false            *           1259    17342    identity_provider_config    TABLE     �   CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 ,   DROP TABLE public.identity_provider_config;
       public         heap    keycloak    false            /           1259    17448    identity_provider_mapper    TABLE       CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 ,   DROP TABLE public.identity_provider_mapper;
       public         heap    keycloak    false            0           1259    17454    idp_mapper_config    TABLE     �   CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.idp_mapper_config;
       public         heap    keycloak    false            �            1259    16425    invoice_seq1    SEQUENCE     ~   CREATE SEQUENCE public.invoice_seq1
    START WITH 100001
    INCREMENT BY 1
    MINVALUE 100000
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.invoice_seq1;
       public          keycloak    false                       1259    16837    invoice    TABLE     �  CREATE TABLE public.invoice (
    invoiceid integer DEFAULT nextval('public.invoice_seq1'::regclass) NOT NULL,
    orgid integer,
    accountid integer,
    startdate timestamp with time zone,
    invoicegenerateddate timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    datausageingb double precision DEFAULT 0 NOT NULL,
    datausagecharge double precision,
    subscriptioncharge double precision,
    totaltaxableamount double precision,
    gstrate double precision,
    taxamount double precision,
    discount integer,
    totalamount double precision,
    enddate timestamp with time zone,
    duedate timestamp with time zone,
    paymentstatus character varying(100),
    lastupdatetime timestamp without time zone NOT NULL
);
    DROP TABLE public.invoice;
       public         heap    keycloak    false    222            @           1259    17739    keycloak_group    TABLE     �   CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);
 "   DROP TABLE public.keycloak_group;
       public         heap    keycloak    false                       1259    16941    keycloak_role    TABLE     b  CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);
 !   DROP TABLE public.keycloak_role;
       public         heap    keycloak    false            �            1259    16403    location_seq    SEQUENCE     u   CREATE SEQUENCE public.location_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.location_seq;
       public          keycloak    false            �            1259    16506    location    TABLE     d  CREATE TABLE public.location (
    cid integer DEFAULT nextval('public.location_seq'::regclass) NOT NULL,
    pid integer,
    name character varying NOT NULL,
    userid integer NOT NULL,
    isroot boolean DEFAULT false NOT NULL,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.location;
       public         heap    keycloak    false    211            .           1259    17445    migration_model    TABLE     �   CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.migration_model;
       public         heap    keycloak    false            �            1259    16431    notifications_seq    SEQUENCE     z   CREATE SEQUENCE public.notifications_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.notifications_seq;
       public          keycloak    false            �            1259    16724    notifications    TABLE     �  CREATE TABLE public.notifications (
    notificationid integer DEFAULT nextval('public.notifications_seq'::regclass) NOT NULL,
    userid integer NOT NULL,
    notificationtype character varying,
    eventinfo json,
    validuntiltime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying
);
 !   DROP TABLE public.notifications;
       public         heap    keycloak    false    225            ?           1259    17729    offline_client_session    TABLE     �  CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);
 *   DROP TABLE public.offline_client_session;
       public         heap    keycloak    false            >           1259    17723    offline_user_session    TABLE     P  CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.offline_user_session;
       public         heap    keycloak    false            �            1259    16385    org_seq    SEQUENCE     p   CREATE SEQUENCE public.org_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.org_seq;
       public          keycloak    false            �            1259    16451    org    TABLE     Y  CREATE TABLE public.org (
    orgid integer DEFAULT nextval('public.org_seq'::regclass) NOT NULL,
    orgname character varying(36) NOT NULL,
    orgshortname character varying(25) NOT NULL,
    orgrootname character varying(64) NOT NULL,
    versioned boolean NOT NULL,
    sharedoutsideorg boolean NOT NULL,
    bucketname character varying(50) NOT NULL,
    encrypted boolean NOT NULL,
    isautoonboardenabled boolean DEFAULT true NOT NULL,
    endpointexpirationtime integer NOT NULL,
    lastupdateuser character varying(100) NOT NULL,
    lastupdatetime timestamp without time zone NOT NULL
);
    DROP TABLE public.org;
       public         heap    keycloak    false    202            �            1259    16445    orgdatausagedetails_seq1    SEQUENCE     �   CREATE SEQUENCE public.orgdatausagedetails_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.orgdatausagedetails_seq1;
       public          keycloak    false                       1259    16812    orgdatausagedetails    TABLE     E  CREATE TABLE public.orgdatausagedetails (
    orgdatausagedetailsid integer DEFAULT nextval('public.orgdatausagedetails_seq1'::regclass) NOT NULL,
    orgid integer NOT NULL,
    date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    bucketname character varying(100),
    currentdatausage bigint DEFAULT 0 NOT NULL
);
 '   DROP TABLE public.orgdatausagedetails;
       public         heap    keycloak    false    232            �            1259    16427    orgdetails_seq1    SEQUENCE     x   CREATE SEQUENCE public.orgdetails_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.orgdetails_seq1;
       public          keycloak    false                       1259    16778 
   orgdetails    TABLE     I  CREATE TABLE public.orgdetails (
    orgdetailsid integer DEFAULT nextval('public.orgdetails_seq1'::regclass) NOT NULL,
    orgid integer NOT NULL,
    planid integer DEFAULT 1 NOT NULL,
    registeredat timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    billingdate timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    isactive boolean DEFAULT true NOT NULL,
    currentdatausage bigint DEFAULT 0 NOT NULL,
    maxstorageusage bigint DEFAULT 0 NOT NULL,
    prevdatausage bigint DEFAULT 0 NOT NULL,
    whitelistedips character varying,
    domain character varying(64),
    txtchecksubdomain character varying(100),
    txtrecords character varying(100),
    customurl character varying(100),
    lastupdateuser character varying(60),
    lastupdatetime timestamp without time zone,
    customdomainstatus character varying(24)
);
    DROP TABLE public.orgdetails;
       public         heap    keycloak    false    223            �            1259    16419    payment_seq    SEQUENCE     t   CREATE SEQUENCE public.payment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.payment_seq;
       public          keycloak    false            �            1259    16421    payment_seq2    SEQUENCE     �   CREATE SEQUENCE public.payment_seq2
    START WITH 1000000
    INCREMENT BY 1
    MINVALUE 1000000
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.payment_seq2;
       public          keycloak    false            �            1259    16748    paymenttransactions    TABLE     {  CREATE TABLE public.paymenttransactions (
    paymenttransid integer DEFAULT nextval('public.payment_seq'::regclass) NOT NULL,
    paymentid integer DEFAULT nextval('public.payment_seq2'::regclass) NOT NULL,
    userid integer NOT NULL,
    accountid integer NOT NULL,
    planid integer DEFAULT 1 NOT NULL,
    transactiontype character varying NOT NULL,
    orderid character varying,
    paymentgatewayid character varying,
    signatureid character varying,
    amount integer NOT NULL,
    currency character varying NOT NULL,
    status character varying,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.paymenttransactions;
       public         heap    keycloak    false    219    220            �            1259    16393    permission_seq    SEQUENCE     w   CREATE SEQUENCE public.permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.permission_seq;
       public          keycloak    false            �            1259    16604 
   permission    TABLE     �  CREATE TABLE public.permission (
    permissionid integer DEFAULT nextval('public.permission_seq'::regclass) NOT NULL,
    print boolean NOT NULL,
    download boolean NOT NULL,
    share boolean NOT NULL,
    clone boolean NOT NULL,
    delete boolean NOT NULL,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.permission;
       public         heap    keycloak    false    206            L           1259    17950    policy_config    TABLE     �   CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 !   DROP TABLE public.policy_config;
       public         heap    keycloak    false            &           1259    17313    protocol_mapper    TABLE     1  CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);
 #   DROP TABLE public.protocol_mapper;
       public         heap    keycloak    false            '           1259    17320    protocol_mapper_config    TABLE     �   CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.protocol_mapper_config;
       public         heap    keycloak    false            �            1259    16449    publicdomain_seq    SEQUENCE     y   CREATE SEQUENCE public.publicdomain_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.publicdomain_seq;
       public          keycloak    false            �            1259    16740    publicdomain    TABLE     �   CREATE TABLE public.publicdomain (
    domainid integer DEFAULT nextval('public.publicdomain_seq'::regclass) NOT NULL,
    domain character varying(20) NOT NULL
);
     DROP TABLE public.publicdomain;
       public         heap    keycloak    false    234                       1259    16948    realm    TABLE     �	  CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);
    DROP TABLE public.realm;
       public         heap    keycloak    false                       1259    16966    realm_attribute    TABLE     �   CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);
 #   DROP TABLE public.realm_attribute;
       public         heap    keycloak    false            D           1259    17755    realm_default_groups    TABLE     �   CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 (   DROP TABLE public.realm_default_groups;
       public         heap    keycloak    false            -           1259    17437    realm_enabled_event_types    TABLE     �   CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 -   DROP TABLE public.realm_enabled_event_types;
       public         heap    keycloak    false                       1259    16975    realm_events_listeners    TABLE     �   CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 *   DROP TABLE public.realm_events_listeners;
       public         heap    keycloak    false            e           1259    18479    realm_localizations    TABLE     �   CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);
 '   DROP TABLE public.realm_localizations;
       public         heap    keycloak    false                       1259    16978    realm_required_credential    TABLE       CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);
 -   DROP TABLE public.realm_required_credential;
       public         heap    keycloak    false                       1259    16986    realm_smtp_config    TABLE     �   CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.realm_smtp_config;
       public         heap    keycloak    false            +           1259    17352    realm_supported_locales    TABLE     �   CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 +   DROP TABLE public.realm_supported_locales;
       public         heap    keycloak    false                       1259    16998    redirect_uris    TABLE        CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.redirect_uris;
       public         heap    keycloak    false            �            1259    16443    request_seq1    SEQUENCE     u   CREATE SEQUENCE public.request_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.request_seq1;
       public          keycloak    false            	           1259    16875    requestdata    TABLE     ]  CREATE TABLE public.requestdata (
    requestid integer DEFAULT nextval('public.request_seq1'::regclass) NOT NULL,
    email character varying NOT NULL,
    org character varying NOT NULL,
    url character varying NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resourceid integer,
    size bigint DEFAULT 0
);
    DROP TABLE public.requestdata;
       public         heap    keycloak    false    231            =           1259    17686    required_action_config    TABLE     �   CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.required_action_config;
       public         heap    keycloak    false            <           1259    17678    required_action_provider    TABLE     \  CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);
 ,   DROP TABLE public.required_action_provider;
       public         heap    keycloak    false            �            1259    16391    resource_seq    SEQUENCE     u   CREATE SEQUENCE public.resource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.resource_seq;
       public          keycloak    false            �            1259    16555    resource    TABLE     �  CREATE TABLE public.resource (
    resourceid integer DEFAULT nextval('public.resource_seq'::regclass) NOT NULL,
    lid integer,
    uri character varying,
    filename character varying(255) NOT NULL,
    contenttype character varying(100) NOT NULL,
    description character varying(255),
    ownerid integer NOT NULL,
    roleid integer NOT NULL,
    pid integer NOT NULL,
    isfolder boolean NOT NULL,
    isshared boolean DEFAULT false,
    label1 character varying(15),
    label2 character varying(15),
    label3 character varying(15),
    lastupdateuser character varying(100) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.resource;
       public         heap    keycloak    false    205            b           1259    18406    resource_attribute    TABLE       CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);
 &   DROP TABLE public.resource_attribute;
       public         heap    keycloak    false            N           1259    17978    resource_policy    TABLE     �   CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
 #   DROP TABLE public.resource_policy;
       public         heap    keycloak    false            M           1259    17963    resource_scope    TABLE     �   CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 "   DROP TABLE public.resource_scope;
       public         heap    keycloak    false            H           1259    17897    resource_server    TABLE     �   CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);
 #   DROP TABLE public.resource_server;
       public         heap    keycloak    false            a           1259    18382    resource_server_perm_ticket    TABLE     �  CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);
 /   DROP TABLE public.resource_server_perm_ticket;
       public         heap    keycloak    false            K           1259    17935    resource_server_policy    TABLE     y  CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);
 *   DROP TABLE public.resource_server_policy;
       public         heap    keycloak    false            I           1259    17905    resource_server_resource    TABLE     �  CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);
 ,   DROP TABLE public.resource_server_resource;
       public         heap    keycloak    false            J           1259    17920    resource_server_scope    TABLE       CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);
 )   DROP TABLE public.resource_server_scope;
       public         heap    keycloak    false            c           1259    18425    resource_uris    TABLE     �   CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.resource_uris;
       public         heap    keycloak    false            �            1259    16411    resourcetransaction_seq    SEQUENCE     �   CREATE SEQUENCE public.resourcetransaction_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.resourcetransaction_seq;
       public          keycloak    false            �            1259    16578    resourcetransaction    TABLE     /  CREATE TABLE public.resourcetransaction (
    resourcetransactionid integer DEFAULT nextval('public.resourcetransaction_seq'::regclass) NOT NULL,
    resourceid integer,
    operation character varying,
    clientid character varying,
    requestid character varying,
    uri character varying,
    uploadid character varying(255),
    filename character varying(255) NOT NULL,
    contenttype character varying(100) NOT NULL,
    description character varying(255),
    ownerid integer NOT NULL,
    roleid integer NOT NULL,
    pid integer NOT NULL,
    isfolder boolean NOT NULL,
    inprogress boolean NOT NULL,
    completestatus boolean NOT NULL,
    lastupdateuser character varying(100) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    expirationtime integer NOT NULL
);
 '   DROP TABLE public.resourcetransaction;
       public         heap    keycloak    false    215            �            1259    16401    resourceversion_seq    SEQUENCE     |   CREATE SEQUENCE public.resourceversion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.resourceversion_seq;
       public          keycloak    false            �            1259    16588    resourceversion    TABLE     �  CREATE TABLE public.resourceversion (
    resourceversionid integer DEFAULT nextval('public.resourceversion_seq'::regclass) NOT NULL,
    author character varying NOT NULL,
    filename character varying(255) NOT NULL,
    resourceid integer NOT NULL,
    size bigint DEFAULT 0,
    version integer NOT NULL,
    islatest boolean NOT NULL,
    dsversion character varying,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.resourceversion;
       public         heap    keycloak    false    210            �            1259    16395    role_seq    SEQUENCE     q   CREATE SEQUENCE public.role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.role_seq;
       public          keycloak    false            �            1259    16497    role    TABLE       CREATE TABLE public.role (
    roleid integer DEFAULT nextval('public.role_seq'::regclass) NOT NULL,
    rolename character varying(15) NOT NULL,
    lastupdateuser character varying(50),
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.role;
       public         heap    keycloak    false    207            d           1259    18435    role_attribute    TABLE     �   CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);
 "   DROP TABLE public.role_attribute;
       public         heap    keycloak    false            �            1259    16397    rolepermissions_seq    SEQUENCE     |   CREATE SEQUENCE public.rolepermissions_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.rolepermissions_seq;
       public          keycloak    false            �            1259    16611    rolepermissions    TABLE     A  CREATE TABLE public.rolepermissions (
    rolepermissionid integer DEFAULT nextval('public.rolepermissions_seq'::regclass) NOT NULL,
    roleid integer NOT NULL,
    permissionid integer NOT NULL,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.rolepermissions;
       public         heap    keycloak    false    208                       1259    17001    scope_mapping    TABLE     �   CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 !   DROP TABLE public.scope_mapping;
       public         heap    keycloak    false            O           1259    17993    scope_policy    TABLE     �   CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
     DROP TABLE public.scope_policy;
       public         heap    keycloak    false            �            1259    16405    sharedlocation_seq    SEQUENCE     {   CREATE SEQUENCE public.sharedlocation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sharedlocation_seq;
       public          keycloak    false            �            1259    16522    sharedlocation    TABLE     p  CREATE TABLE public.sharedlocation (
    cid integer DEFAULT nextval('public.sharedlocation_seq'::regclass) NOT NULL,
    pid integer,
    name character varying NOT NULL,
    userid integer NOT NULL,
    isroot boolean DEFAULT false NOT NULL,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.sharedlocation;
       public         heap    keycloak    false    212            �            1259    16407    sharedresource_seq    SEQUENCE     {   CREATE SEQUENCE public.sharedresource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sharedresource_seq;
       public          keycloak    false            �            1259    16687    sharedresource    TABLE     t  CREATE TABLE public.sharedresource (
    sharedresourceid integer DEFAULT nextval('public.sharedresource_seq'::regclass) NOT NULL,
    userid integer NOT NULL,
    roleid integer NOT NULL,
    resourceid integer NOT NULL,
    pid integer NOT NULL,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.sharedresource;
       public         heap    keycloak    false    213                       1259    16851    storageusage    TABLE       CREATE TABLE public.storageusage (
    usgid integer,
    orgid integer,
    currdatausage integer,
    maxdatausage integer,
    startdate timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    enddate timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.storageusage;
       public         heap    keycloak    false            �            1259    16423    subscriptions_seq    SEQUENCE     z   CREATE SEQUENCE public.subscriptions_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.subscriptions_seq;
       public          keycloak    false            �            1259    16760    subscriptions    TABLE     �  CREATE TABLE public.subscriptions (
    subscriptionid integer DEFAULT nextval('public.subscriptions_seq'::regclass) NOT NULL,
    subscriptionkey character varying,
    subscriptionname character varying NOT NULL,
    subscriptioncharge integer,
    validity integer,
    addons integer,
    discount integer,
    isactive boolean DEFAULT true NOT NULL,
    isexternal boolean NOT NULL
);
 !   DROP TABLE public.subscriptions;
       public         heap    keycloak    false    221            �            1259    16415    systemrole_seq    SEQUENCE     w   CREATE SEQUENCE public.systemrole_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.systemrole_seq;
       public          keycloak    false            �            1259    16644 
   systemrole    TABLE       CREATE TABLE public.systemrole (
    systemroleid integer DEFAULT nextval('public.systemrole_seq'::regclass) NOT NULL,
    rolename character varying(15) NOT NULL,
    lastupdateuser character varying(50),
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.systemrole;
       public         heap    keycloak    false    217            �            1259    16387    user_seq    SEQUENCE     q   CREATE SEQUENCE public.user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.user_seq;
       public          keycloak    false            �            1259    16460    user    TABLE     .  CREATE TABLE public."user" (
    userid integer DEFAULT nextval('public.user_seq'::regclass) NOT NULL,
    firstname character varying(20),
    accountid integer,
    lastname character varying(20),
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    mobile character varying(15),
    active boolean DEFAULT true NOT NULL,
    canpay boolean DEFAULT true NOT NULL,
    orgid integer NOT NULL,
    lastupdateuser character varying(50) NOT NULL,
    lastupdatetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."user";
       public         heap    keycloak    false    203                       1259    17007    user_attribute    TABLE     �   CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);
 "   DROP TABLE public.user_attribute;
       public         heap    keycloak    false            1           1259    17460    user_consent    TABLE     7  CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
     DROP TABLE public.user_consent;
       public         heap    keycloak    false            _           1259    18357    user_consent_client_scope    TABLE     �   CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.user_consent_client_scope;
       public         heap    keycloak    false                       1259    17013    user_entity    TABLE     =  CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_entity;
       public         heap    keycloak    false                       1259    17022    user_federation_config    TABLE     �   CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.user_federation_config;
       public         heap    keycloak    false            8           1259    17576    user_federation_mapper    TABLE     $  CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 *   DROP TABLE public.user_federation_mapper;
       public         heap    keycloak    false            9           1259    17582    user_federation_mapper_config    TABLE     �   CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 1   DROP TABLE public.user_federation_mapper_config;
       public         heap    keycloak    false                       1259    17028    user_federation_provider    TABLE     ;  CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);
 ,   DROP TABLE public.user_federation_provider;
       public         heap    keycloak    false            C           1259    17752    user_group_membership    TABLE     �   CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);
 )   DROP TABLE public.user_group_membership;
       public         heap    keycloak    false                       1259    17034    user_required_action    TABLE     �   CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);
 (   DROP TABLE public.user_required_action;
       public         heap    keycloak    false                        1259    17037    user_role_mapping    TABLE     �   CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);
 %   DROP TABLE public.user_role_mapping;
       public         heap    keycloak    false            !           1259    17040    user_session    TABLE     �  CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);
     DROP TABLE public.user_session;
       public         heap    keycloak    false            ,           1259    17355    user_session_note    TABLE     �   CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);
 %   DROP TABLE public.user_session_note;
       public         heap    keycloak    false            �            1259    16429    userdatausagedetails_seq1    SEQUENCE     �   CREATE SEQUENCE public.userdatausagedetails_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.userdatausagedetails_seq1;
       public          keycloak    false                       1259    16799    userdatausagedetails    TABLE     >  CREATE TABLE public.userdatausagedetails (
    userdatausagedetailsid integer DEFAULT nextval('public.userdatausagedetails_seq1'::regclass) NOT NULL,
    userid integer NOT NULL,
    orgid integer NOT NULL,
    date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    currentdatausage bigint DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.userdatausagedetails;
       public         heap    keycloak    false    224            �            1259    16409    usergroups_seq    SEQUENCE     w   CREATE SEQUENCE public.usergroups_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usergroups_seq;
       public          keycloak    false            �            1259    16669 
   usergroups    TABLE     �   CREATE TABLE public.usergroups (
    usergroupsid integer DEFAULT nextval('public.usergroups_seq'::regclass) NOT NULL,
    userid integer NOT NULL,
    groupid integer NOT NULL
);
    DROP TABLE public.usergroups;
       public         heap    keycloak    false    214                       1259    17004    username_login_failure    TABLE       CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);
 *   DROP TABLE public.username_login_failure;
       public         heap    keycloak    false            �            1259    16399    userroles_seq    SEQUENCE     v   CREATE SEQUENCE public.userroles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.userroles_seq;
       public          keycloak    false            �            1259    16628 	   userroles    TABLE     �   CREATE TABLE public.userroles (
    userrolesid integer DEFAULT nextval('public.userroles_seq'::regclass) NOT NULL,
    userid integer NOT NULL,
    roleid integer NOT NULL
);
    DROP TABLE public.userroles;
       public         heap    keycloak    false    209            �            1259    16437    usersrelation_seq1    SEQUENCE     {   CREATE SEQUENCE public.usersrelation_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.usersrelation_seq1;
       public          keycloak    false                       1259    16845    usersrelation    TABLE     �   CREATE TABLE public.usersrelation (
    rid integer DEFAULT nextval('public.usersrelation_seq1'::regclass) NOT NULL,
    userid integer NOT NULL,
    parentuid integer NOT NULL
);
 !   DROP TABLE public.usersrelation;
       public         heap    keycloak    false    228            �            1259    16417    usersystemroles_seq    SEQUENCE     |   CREATE SEQUENCE public.usersystemroles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.usersystemroles_seq;
       public          keycloak    false            �            1259    16653    usersystemroles    TABLE     �   CREATE TABLE public.usersystemroles (
    usersystemrolesid integer DEFAULT nextval('public.usersystemroles_seq'::regclass) NOT NULL,
    userid integer NOT NULL,
    systemroleid integer NOT NULL
);
 #   DROP TABLE public.usersystemroles;
       public         heap    keycloak    false    218            "           1259    17053    web_origins    TABLE     }   CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
    DROP TABLE public.web_origins;
       public         heap    keycloak    false            p          0    16825    account 
   TABLE DATA           �   COPY public.account (accountid, userid, orgid, accountname, accounttype, plantype, gstno, status, createddate, lastinvoicegenerateddate, lastpaymentdate) FROM stdin;
    public          keycloak    false    260    �      l          0    16770    accountsubscriptions 
   TABLE DATA           �   COPY public.accountsubscriptions (accountsubscriptionsid, accountid, subscriptionid, assigneddate, validuntiltime, lastupdatetime) FROM stdin;
    public          keycloak    false    256   ��      �          0    17547    admin_event_entity 
   TABLE DATA           �   COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
    public          keycloak    false    307   ��      �          0    18008    associated_policy 
   TABLE DATA           L   COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
    public          keycloak    false    336   ��      �          0    17565    authentication_execution 
   TABLE DATA           �   COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
    public          keycloak    false    310   ނ      �          0    17559    authentication_flow 
   TABLE DATA           q   COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
    public          keycloak    false    309   ��      �          0    17553    authenticator_config 
   TABLE DATA           C   COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
    public          keycloak    false    308   W�      �          0    17570    authenticator_config_entry 
   TABLE DATA           S   COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
    public          keycloak    false    311   j�      �          0    18023    broker_link 
   TABLE DATA           �   COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
    public          keycloak    false    337   h�      x          0    16902    client 
   TABLE DATA           �  COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
    public          keycloak    false    268   ��      �          0    17276    client_attributes 
   TABLE DATA           C   COPY public.client_attributes (client_id, name, value) FROM stdin;
    public          keycloak    false    291   ��      �          0    18283    client_auth_flow_bindings 
   TABLE DATA           U   COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
    public          keycloak    false    348   ]�      �          0    18157    client_initial_access 
   TABLE DATA           n   COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
    public          keycloak    false    347   z�      �          0    17288    client_node_registrations 
   TABLE DATA           K   COPY public.client_node_registrations (client_id, value, name) FROM stdin;
    public          keycloak    false    293   ��      �          0    17807    client_scope 
   TABLE DATA           Q   COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
    public          keycloak    false    325   ��      �          0    17822    client_scope_attributes 
   TABLE DATA           H   COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
    public          keycloak    false    326   ?�      �          0    18325    client_scope_client 
   TABLE DATA           Q   COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
    public          keycloak    false    349   ��      �          0    17828    client_scope_role_mapping 
   TABLE DATA           F   COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
    public          keycloak    false    327   �      y          0    16914    client_session 
   TABLE DATA           �   COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
    public          keycloak    false    269   ��      �          0    17591    client_session_auth_status 
   TABLE DATA           [   COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
    public          keycloak    false    314   ξ      �          0    17282    client_session_note 
   TABLE DATA           J   COPY public.client_session_note (name, value, client_session) FROM stdin;
    public          keycloak    false    292   �      �          0    17469    client_session_prot_mapper 
   TABLE DATA           X   COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
    public          keycloak    false    306   �      z          0    16920    client_session_role 
   TABLE DATA           F   COPY public.client_session_role (role_id, client_session) FROM stdin;
    public          keycloak    false    270   %�      �          0    17672    client_user_session_note 
   TABLE DATA           O   COPY public.client_user_session_note (name, value, client_session) FROM stdin;
    public          keycloak    false    315   B�      �          0    18073 	   component 
   TABLE DATA           h   COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
    public          keycloak    false    345   _�      �          0    18067    component_config 
   TABLE DATA           I   COPY public.component_config (id, component_id, name, value) FROM stdin;
    public          keycloak    false    344   �      {          0    16923    composite_role 
   TABLE DATA           ?   COPY public.composite_role (composite, child_role) FROM stdin;
    public          keycloak    false    271   ��      |          0    16926 
   credential 
   TABLE DATA              COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
    public          keycloak    false    272   �      w          0    16893    databasechangelog 
   TABLE DATA           �   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          keycloak    false    267   q      v          0    16888    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          keycloak    false    266   #$      t          0    16856 
   datareport 
   TABLE DATA           Y   COPY public.datareport (reportid, username, orgname, status, lastupdatetime) FROM stdin;
    public          keycloak    false    264   Q$      �          0    18341    default_client_scope 
   TABLE DATA           Q   COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
    public          keycloak    false    350   n$      }          0    16932    event_entity 
   TABLE DATA           �   COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
    public          keycloak    false    273   t'      ]          0    16538    favouriteresource 
   TABLE DATA           Y   COPY public.favouriteresource (favresourceid, username, orgname, resourceid) FROM stdin;
    public          keycloak    false    241   �'      �          0    18029    fed_user_attribute 
   TABLE DATA           e   COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
    public          keycloak    false    338   �'      �          0    18035    fed_user_consent 
   TABLE DATA           �   COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public          keycloak    false    339   �'      �          0    18367    fed_user_consent_cl_scope 
   TABLE DATA           N   COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
    public          keycloak    false    352   �'      �          0    18044    fed_user_credential 
   TABLE DATA           �   COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
    public          keycloak    false    340   (      �          0    18054    fed_user_group_membership 
   TABLE DATA           e   COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public          keycloak    false    341   "(      �          0    18057    fed_user_required_action 
   TABLE DATA           k   COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
    public          keycloak    false    342   ?(      �          0    18064    fed_user_role_mapping 
   TABLE DATA           `   COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public          keycloak    false    343   \(      �          0    17326    federated_identity 
   TABLE DATA           �   COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
    public          keycloak    false    296   y(      �          0    18133    federated_user 
   TABLE DATA           K   COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
    public          keycloak    false    346   �(      Y          0    16478    group 
   TABLE DATA           l   COPY public."group" (groupid, name, description, orgid, userid, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    237   �(      �          0    17745    group_attribute 
   TABLE DATA           D   COPY public.group_attribute (id, name, value, group_id) FROM stdin;
    public          keycloak    false    322   ^)      �          0    17742    group_role_mapping 
   TABLE DATA           ?   COPY public.group_role_mapping (role_id, group_id) FROM stdin;
    public          keycloak    false    321   {)      �          0    17332    identity_provider 
   TABLE DATA             COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
    public          keycloak    false    297   �)      �          0    17342    identity_provider_config 
   TABLE DATA           U   COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
    public          keycloak    false    298   `*      �          0    17448    identity_provider_mapper 
   TABLE DATA           b   COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
    public          keycloak    false    303   �+      �          0    17454    idp_mapper_config 
   TABLE DATA           G   COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
    public          keycloak    false    304   -      q          0    16837    invoice 
   TABLE DATA             COPY public.invoice (invoiceid, orgid, accountid, startdate, invoicegenerateddate, datausageingb, datausagecharge, subscriptioncharge, totaltaxableamount, gstrate, taxamount, discount, totalamount, enddate, duedate, paymentstatus, lastupdatetime) FROM stdin;
    public          keycloak    false    261   /      �          0    17739    keycloak_group 
   TABLE DATA           J   COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
    public          keycloak    false    320   )/      ~          0    16941    keycloak_role 
   TABLE DATA           }   COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
    public          keycloak    false    274   F/      [          0    16506    location 
   TABLE DATA           b   COPY public.location (cid, pid, name, userid, isroot, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    239   A      �          0    17445    migration_model 
   TABLE DATA           C   COPY public.migration_model (id, version, update_time) FROM stdin;
    public          keycloak    false    302   B      h          0    16724    notifications 
   TABLE DATA           �   COPY public.notifications (notificationid, userid, notificationtype, eventinfo, validuntiltime, lastupdateuser, lastupdatetime, status) FROM stdin;
    public          keycloak    false    252   MB      �          0    17729    offline_client_session 
   TABLE DATA           �   COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
    public          keycloak    false    319   jB      �          0    17723    offline_user_session 
   TABLE DATA           �   COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
    public          keycloak    false    318   �B      W          0    16451    org 
   TABLE DATA           �   COPY public.org (orgid, orgname, orgshortname, orgrootname, versioned, sharedoutsideorg, bucketname, encrypted, isautoonboardenabled, endpointexpirationtime, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    235   �B      o          0    16812    orgdatausagedetails 
   TABLE DATA           o   COPY public.orgdatausagedetails (orgdatausagedetailsid, orgid, date, bucketname, currentdatausage) FROM stdin;
    public          keycloak    false    259   �C      m          0    16778 
   orgdetails 
   TABLE DATA             COPY public.orgdetails (orgdetailsid, orgid, planid, registeredat, billingdate, isactive, currentdatausage, maxstorageusage, prevdatausage, whitelistedips, domain, txtchecksubdomain, txtrecords, customurl, lastupdateuser, lastupdatetime, customdomainstatus) FROM stdin;
    public          keycloak    false    257   �C      j          0    16748    paymenttransactions 
   TABLE DATA           �   COPY public.paymenttransactions (paymenttransid, paymentid, userid, accountid, planid, transactiontype, orderid, paymentgatewayid, signatureid, amount, currency, status, lastupdatetime) FROM stdin;
    public          keycloak    false    254   YD      a          0    16604 
   permission 
   TABLE DATA           y   COPY public.permission (permissionid, print, download, share, clone, delete, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    245   vD      �          0    17950    policy_config 
   TABLE DATA           ?   COPY public.policy_config (policy_id, name, value) FROM stdin;
    public          keycloak    false    332   �D      �          0    17313    protocol_mapper 
   TABLE DATA           o   COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
    public          keycloak    false    294   �D      �          0    17320    protocol_mapper_config 
   TABLE DATA           Q   COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
    public          keycloak    false    295   4S      i          0    16740    publicdomain 
   TABLE DATA           8   COPY public.publicdomain (domainid, domain) FROM stdin;
    public          keycloak    false    253   �d                0    16948    realm 
   TABLE DATA              COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
    public          keycloak    false    275   oe      �          0    16966    realm_attribute 
   TABLE DATA           @   COPY public.realm_attribute (name, realm_id, value) FROM stdin;
    public          keycloak    false    276   \h      �          0    17755    realm_default_groups 
   TABLE DATA           B   COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
    public          keycloak    false    324   �m      �          0    17437    realm_enabled_event_types 
   TABLE DATA           D   COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
    public          keycloak    false    301   �m      �          0    16975    realm_events_listeners 
   TABLE DATA           A   COPY public.realm_events_listeners (realm_id, value) FROM stdin;
    public          keycloak    false    277   �m      �          0    18479    realm_localizations 
   TABLE DATA           F   COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
    public          keycloak    false    357   2n      �          0    16978    realm_required_credential 
   TABLE DATA           ^   COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
    public          keycloak    false    278   On      �          0    16986    realm_smtp_config 
   TABLE DATA           B   COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
    public          keycloak    false    279   �n      �          0    17352    realm_supported_locales 
   TABLE DATA           B   COPY public.realm_supported_locales (realm_id, value) FROM stdin;
    public          keycloak    false    299   �n      �          0    16998    redirect_uris 
   TABLE DATA           9   COPY public.redirect_uris (client_id, value) FROM stdin;
    public          keycloak    false    280   �n      u          0    16875    requestdata 
   TABLE DATA           c   COPY public.requestdata (requestid, email, org, url, lastupdatetime, resourceid, size) FROM stdin;
    public          keycloak    false    265   �p      �          0    17686    required_action_config 
   TABLE DATA           Q   COPY public.required_action_config (required_action_id, value, name) FROM stdin;
    public          keycloak    false    317   ~q      �          0    17678    required_action_provider 
   TABLE DATA           }   COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
    public          keycloak    false    316   �q      ^          0    16555    resource 
   TABLE DATA           �   COPY public.resource (resourceid, lid, uri, filename, contenttype, description, ownerid, roleid, pid, isfolder, isshared, label1, label2, label3, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    242   �u      �          0    18406    resource_attribute 
   TABLE DATA           J   COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
    public          keycloak    false    354   Iz      �          0    17978    resource_policy 
   TABLE DATA           A   COPY public.resource_policy (resource_id, policy_id) FROM stdin;
    public          keycloak    false    334   fz      �          0    17963    resource_scope 
   TABLE DATA           ?   COPY public.resource_scope (resource_id, scope_id) FROM stdin;
    public          keycloak    false    333   �z      �          0    17897    resource_server 
   TABLE DATA           k   COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
    public          keycloak    false    328   �z      �          0    18382    resource_server_perm_ticket 
   TABLE DATA           �   COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
    public          keycloak    false    353   �z      �          0    17935    resource_server_policy 
   TABLE DATA           �   COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
    public          keycloak    false    331   �z      �          0    17905    resource_server_resource 
   TABLE DATA           �   COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
    public          keycloak    false    329   �z      �          0    17920    resource_server_scope 
   TABLE DATA           e   COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
    public          keycloak    false    330   {      �          0    18425    resource_uris 
   TABLE DATA           ;   COPY public.resource_uris (resource_id, value) FROM stdin;
    public          keycloak    false    355   1{      _          0    16578    resourcetransaction 
   TABLE DATA             COPY public.resourcetransaction (resourcetransactionid, resourceid, operation, clientid, requestid, uri, uploadid, filename, contenttype, description, ownerid, roleid, pid, isfolder, inprogress, completestatus, lastupdateuser, lastupdatetime, expirationtime) FROM stdin;
    public          keycloak    false    243   N{      `          0    16588    resourceversion 
   TABLE DATA           �   COPY public.resourceversion (resourceversionid, author, filename, resourceid, size, version, islatest, dsversion, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    244   k{      Z          0    16497    role 
   TABLE DATA           P   COPY public.role (roleid, rolename, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    238   e~      �          0    18435    role_attribute 
   TABLE DATA           B   COPY public.role_attribute (id, role_id, name, value) FROM stdin;
    public          keycloak    false    356   �~      b          0    16611    rolepermissions 
   TABLE DATA           q   COPY public.rolepermissions (rolepermissionid, roleid, permissionid, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    246   �~      �          0    17001    scope_mapping 
   TABLE DATA           ;   COPY public.scope_mapping (client_id, role_id) FROM stdin;
    public          keycloak    false    281   B      �          0    17993    scope_policy 
   TABLE DATA           ;   COPY public.scope_policy (scope_id, policy_id) FROM stdin;
    public          keycloak    false    335   2�      \          0    16522    sharedlocation 
   TABLE DATA           h   COPY public.sharedlocation (cid, pid, name, userid, isroot, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    240   O�      g          0    16687    sharedresource 
   TABLE DATA           {   COPY public.sharedresource (sharedresourceid, userid, roleid, resourceid, pid, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    251   7�      s          0    16851    storageusage 
   TABLE DATA           e   COPY public.storageusage (usgid, orgid, currdatausage, maxdatausage, startdate, enddate) FROM stdin;
    public          keycloak    false    263   �      k          0    16760    subscriptions 
   TABLE DATA           �   COPY public.subscriptions (subscriptionid, subscriptionkey, subscriptionname, subscriptioncharge, validity, addons, discount, isactive, isexternal) FROM stdin;
    public          keycloak    false    255   �      d          0    16644 
   systemrole 
   TABLE DATA           \   COPY public.systemrole (systemroleid, rolename, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    248   ��      X          0    16460    user 
   TABLE DATA           �   COPY public."user" (userid, firstname, accountid, lastname, username, email, mobile, active, canpay, orgid, lastupdateuser, lastupdatetime) FROM stdin;
    public          keycloak    false    236   L�      �          0    17007    user_attribute 
   TABLE DATA           B   COPY public.user_attribute (name, value, user_id, id) FROM stdin;
    public          keycloak    false    283   P�      �          0    17460    user_consent 
   TABLE DATA           �   COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public          keycloak    false    305   ʆ      �          0    18357    user_consent_client_scope 
   TABLE DATA           N   COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
    public          keycloak    false    351   �      �          0    17013    user_entity 
   TABLE DATA           �   COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
    public          keycloak    false    284   �      �          0    17022    user_federation_config 
   TABLE DATA           Z   COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
    public          keycloak    false    285   �      �          0    17576    user_federation_mapper 
   TABLE DATA           t   COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
    public          keycloak    false    312   �      �          0    17582    user_federation_mapper_config 
   TABLE DATA           _   COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
    public          keycloak    false    313   "�      �          0    17028    user_federation_provider 
   TABLE DATA           �   COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
    public          keycloak    false    286   ?�      �          0    17752    user_group_membership 
   TABLE DATA           B   COPY public.user_group_membership (group_id, user_id) FROM stdin;
    public          keycloak    false    323   \�      �          0    17034    user_required_action 
   TABLE DATA           H   COPY public.user_required_action (user_id, required_action) FROM stdin;
    public          keycloak    false    287   y�      �          0    17037    user_role_mapping 
   TABLE DATA           =   COPY public.user_role_mapping (role_id, user_id) FROM stdin;
    public          keycloak    false    288   ��      �          0    17040    user_session 
   TABLE DATA           �   COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
    public          keycloak    false    289   /�      �          0    17355    user_session_note 
   TABLE DATA           F   COPY public.user_session_note (user_session, name, value) FROM stdin;
    public          keycloak    false    300   L�      n          0    16799    userdatausagedetails 
   TABLE DATA           m   COPY public.userdatausagedetails (userdatausagedetailsid, userid, orgid, date, currentdatausage) FROM stdin;
    public          keycloak    false    258   i�      f          0    16669 
   usergroups 
   TABLE DATA           C   COPY public.usergroups (usergroupsid, userid, groupid) FROM stdin;
    public          keycloak    false    250   ��      �          0    17004    username_login_failure 
   TABLE DATA           �   COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
    public          keycloak    false    282   ��      c          0    16628 	   userroles 
   TABLE DATA           @   COPY public.userroles (userrolesid, userid, roleid) FROM stdin;
    public          keycloak    false    247   Չ      r          0    16845    usersrelation 
   TABLE DATA           ?   COPY public.usersrelation (rid, userid, parentuid) FROM stdin;
    public          keycloak    false    262   �      e          0    16653    usersystemroles 
   TABLE DATA           R   COPY public.usersystemroles (usersystemrolesid, userid, systemroleid) FROM stdin;
    public          keycloak    false    249   1�      �          0    17053    web_origins 
   TABLE DATA           7   COPY public.web_origins (client_id, value) FROM stdin;
    public          keycloak    false    290   U�      �           0    0    account_seq1    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.account_seq1', 1, false);
          public          keycloak    false    226            �           0    0    accountsubscriptions_seq1    SEQUENCE SET     H   SELECT pg_catalog.setval('public.accountsubscriptions_seq1', 1, false);
          public          keycloak    false    233            �           0    0    datareport_seq1    SEQUENCE SET     >   SELECT pg_catalog.setval('public.datareport_seq1', 1, false);
          public          keycloak    false    230            �           0    0 	   event_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.event_seq', 1, false);
          public          keycloak    false    216            �           0    0    favouriteresource_seq1    SEQUENCE SET     E   SELECT pg_catalog.setval('public.favouriteresource_seq1', 1, false);
          public          keycloak    false    229            �           0    0 	   group_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.group_seq', 6, true);
          public          keycloak    false    204            �           0    0    invoice_seq1    SEQUENCE SET     @   SELECT pg_catalog.setval('public.invoice_seq1', 100001, false);
          public          keycloak    false    222            �           0    0    location_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.location_seq', 13, true);
          public          keycloak    false    211            �           0    0    notifications_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.notifications_seq', 1, false);
          public          keycloak    false    225            �           0    0    org_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('public.org_seq', 4, true);
          public          keycloak    false    202            �           0    0    orgdatausagedetails_seq1    SEQUENCE SET     G   SELECT pg_catalog.setval('public.orgdatausagedetails_seq1', 1, false);
          public          keycloak    false    232            �           0    0    orgdetails_seq1    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orgdetails_seq1', 2, true);
          public          keycloak    false    223            �           0    0    payment_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.payment_seq', 1, false);
          public          keycloak    false    219            �           0    0    payment_seq2    SEQUENCE SET     A   SELECT pg_catalog.setval('public.payment_seq2', 1000000, false);
          public          keycloak    false    220            �           0    0    permission_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.permission_seq', 3, true);
          public          keycloak    false    206            �           0    0    publicdomain_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.publicdomain_seq', 24, true);
          public          keycloak    false    234            �           0    0    request_seq1    SEQUENCE SET     :   SELECT pg_catalog.setval('public.request_seq1', 7, true);
          public          keycloak    false    231            �           0    0    resource_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.resource_seq', 39, true);
          public          keycloak    false    205            �           0    0    resourcetransaction_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.resourcetransaction_seq', 1, true);
          public          keycloak    false    215            �           0    0    resourceversion_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.resourceversion_seq', 36, true);
          public          keycloak    false    210            �           0    0    role_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('public.role_seq', 3, true);
          public          keycloak    false    207            �           0    0    rolepermissions_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.rolepermissions_seq', 3, true);
          public          keycloak    false    208            �           0    0    sharedlocation_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.sharedlocation_seq', 18, true);
          public          keycloak    false    212            �           0    0    sharedresource_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.sharedresource_seq', 14, true);
          public          keycloak    false    213            �           0    0    subscriptions_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.subscriptions_seq', 4, true);
          public          keycloak    false    221            �           0    0    systemrole_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.systemrole_seq', 6, true);
          public          keycloak    false    217            �           0    0    user_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.user_seq', 18, true);
          public          keycloak    false    203            �           0    0    useraccountid_seq1    SEQUENCE SET     E   SELECT pg_catalog.setval('public.useraccountid_seq1', 100001, true);
          public          keycloak    false    227            �           0    0    userdatausagedetails_seq1    SEQUENCE SET     H   SELECT pg_catalog.setval('public.userdatausagedetails_seq1', 1, false);
          public          keycloak    false    224            �           0    0    usergroups_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usergroups_seq', 4, true);
          public          keycloak    false    214            �           0    0    userroles_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.userroles_seq', 7, true);
          public          keycloak    false    209            �           0    0    usersrelation_seq1    SEQUENCE SET     A   SELECT pg_catalog.setval('public.usersrelation_seq1', 1, false);
          public          keycloak    false    228            �           0    0    usersystemroles_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.usersystemroles_seq', 1, true);
          public          keycloak    false    218            ]           2606    18147 &   username_login_failure CONSTRAINT_17-2 
   CONSTRAINT     v   ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);
 R   ALTER TABLE ONLY public.username_login_failure DROP CONSTRAINT "CONSTRAINT_17-2";
       public            keycloak    false    282    282            �           2606    16567    resource UC_PERSON 
   CONSTRAINT     a   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT "UC_PERSON" UNIQUE (filename, ownerid, pid);
 >   ALTER TABLE ONLY public.resource DROP CONSTRAINT "UC_PERSON";
       public            keycloak    false    242    242    242            B           2606    18460 ,   keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2 
   CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);
 X   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
       public            keycloak    false    274    274            "           2606    16834    account accountdetails_pk1 
   CONSTRAINT     _   ALTER TABLE ONLY public.account
    ADD CONSTRAINT accountdetails_pk1 PRIMARY KEY (accountid);
 D   ALTER TABLE ONLY public.account DROP CONSTRAINT accountdetails_pk1;
       public            keycloak    false    260            $           2606    16836    account accountdetails_unq1 
   CONSTRAINT     b   ALTER TABLE ONLY public.account
    ADD CONSTRAINT accountdetails_unq1 UNIQUE (accountid, orgid);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT accountdetails_unq1;
       public            keycloak    false    260    260                       2606    16777 -   accountsubscriptions accountsubscriptions_pk1 
   CONSTRAINT        ALTER TABLE ONLY public.accountsubscriptions
    ADD CONSTRAINT accountsubscriptions_pk1 PRIMARY KEY (accountsubscriptionsid);
 W   ALTER TABLE ONLY public.accountsubscriptions DROP CONSTRAINT accountsubscriptions_pk1;
       public            keycloak    false    256            5           2606    18287 )   client_auth_flow_bindings c_cli_flow_bind 
   CONSTRAINT     |   ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);
 S   ALTER TABLE ONLY public.client_auth_flow_bindings DROP CONSTRAINT c_cli_flow_bind;
       public            keycloak    false    348    348            7           2606    18492 $   client_scope_client c_cli_scope_bind 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);
 N   ALTER TABLE ONLY public.client_scope_client DROP CONSTRAINT c_cli_scope_bind;
       public            keycloak    false    349    349            2           2606    18161 .   client_initial_access cnstr_client_init_acc_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT cnstr_client_init_acc_pk;
       public            keycloak    false    347            �           2606    17793 ,   realm_default_groups con_group_id_def_groups 
   CONSTRAINT     k   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);
 V   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT con_group_id_def_groups;
       public            keycloak    false    324                       2606    18080 !   broker_link constr_broker_link_pk 
   CONSTRAINT     w   ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);
 K   ALTER TABLE ONLY public.broker_link DROP CONSTRAINT constr_broker_link_pk;
       public            keycloak    false    337    337            �           2606    17699 /   client_user_session_note constr_cl_usr_ses_note 
   CONSTRAINT        ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);
 Y   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT constr_cl_usr_ses_note;
       public            keycloak    false    315    315            )           2606    18100 +   component_config constr_component_config_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.component_config DROP CONSTRAINT constr_component_config_pk;
       public            keycloak    false    344            ,           2606    18098    component constr_component_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.component DROP CONSTRAINT constr_component_pk;
       public            keycloak    false    345            !           2606    18096 3   fed_user_required_action constr_fed_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);
 ]   ALTER TABLE ONLY public.fed_user_required_action DROP CONSTRAINT constr_fed_required_action;
       public            keycloak    false    342    342                       2606    18082 *   fed_user_attribute constr_fed_user_attr_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.fed_user_attribute DROP CONSTRAINT constr_fed_user_attr_pk;
       public            keycloak    false    338                       2606    18084 +   fed_user_consent constr_fed_user_consent_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_consent DROP CONSTRAINT constr_fed_user_consent_pk;
       public            keycloak    false    339                       2606    18090 +   fed_user_credential constr_fed_user_cred_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_credential DROP CONSTRAINT constr_fed_user_cred_pk;
       public            keycloak    false    340                       2606    18092 /   fed_user_group_membership constr_fed_user_group 
   CONSTRAINT     |   ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);
 Y   ALTER TABLE ONLY public.fed_user_group_membership DROP CONSTRAINT constr_fed_user_group;
       public            keycloak    false    341    341            %           2606    18094 *   fed_user_role_mapping constr_fed_user_role 
   CONSTRAINT     v   ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);
 T   ALTER TABLE ONLY public.fed_user_role_mapping DROP CONSTRAINT constr_fed_user_role;
       public            keycloak    false    343    343            0           2606    18140 $   federated_user constr_federated_user 
   CONSTRAINT     b   ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.federated_user DROP CONSTRAINT constr_federated_user;
       public            keycloak    false    346            �           2606    18246 0   realm_default_groups constr_realm_default_groups 
   CONSTRAINT     ~   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);
 Z   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT constr_realm_default_groups;
       public            keycloak    false    324    324            �           2606    18263 8   realm_enabled_event_types constr_realm_enabl_event_types 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);
 b   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT constr_realm_enabl_event_types;
       public            keycloak    false    301    301            P           2606    18265 4   realm_events_listeners constr_realm_events_listeners 
   CONSTRAINT        ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);
 ^   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT constr_realm_events_listeners;
       public            keycloak    false    277    277            �           2606    18267 6   realm_supported_locales constr_realm_supported_locales 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);
 `   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT constr_realm_supported_locales;
       public            keycloak    false    299    299            �           2606    17365    identity_provider constraint_2b 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);
 I   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT constraint_2b;
       public            keycloak    false    297            {           2606    17293    client_attributes constraint_3c 
   CONSTRAINT     j   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);
 I   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT constraint_3c;
       public            keycloak    false    291    291            ?           2606    17065    event_entity constraint_4 
   CONSTRAINT     W   ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.event_entity DROP CONSTRAINT constraint_4;
       public            keycloak    false    273            �           2606    17367     federated_identity constraint_40 
   CONSTRAINT     v   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);
 J   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT constraint_40;
       public            keycloak    false    296    296            H           2606    17067    realm constraint_4a 
   CONSTRAINT     Q   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.realm DROP CONSTRAINT constraint_4a;
       public            keycloak    false    275            6           2606    17069     client_session_role constraint_5 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);
 J   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT constraint_5;
       public            keycloak    false    270    270            v           2606    17071    user_session constraint_57 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_session DROP CONSTRAINT constraint_57;
       public            keycloak    false    289            m           2606    17073 &   user_federation_provider constraint_5c 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT constraint_5c;
       public            keycloak    false    286            }           2606    17295 !   client_session_note constraint_5e 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);
 K   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT constraint_5e;
       public            keycloak    false    292    292            .           2606    17077    client constraint_7 
   CONSTRAINT     Q   ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.client DROP CONSTRAINT constraint_7;
       public            keycloak    false    268            3           2606    17079    client_session constraint_8 
   CONSTRAINT     Y   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.client_session DROP CONSTRAINT constraint_8;
       public            keycloak    false    269            Z           2606    17081    scope_mapping constraint_81 
   CONSTRAINT     i   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);
 E   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT constraint_81;
       public            keycloak    false    281    281                       2606    17297 '   client_node_registrations constraint_84 
   CONSTRAINT     r   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);
 Q   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT constraint_84;
       public            keycloak    false    293    293            M           2606    17083    realm_attribute constraint_9 
   CONSTRAINT     f   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);
 F   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT constraint_9;
       public            keycloak    false    276    276            S           2606    17085 '   realm_required_credential constraint_92 
   CONSTRAINT     q   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);
 Q   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT constraint_92;
       public            keycloak    false    278    278            D           2606    17087    keycloak_role constraint_a 
   CONSTRAINT     X   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT constraint_a;
       public            keycloak    false    274            �           2606    18250 0   admin_event_entity constraint_admin_event_entity 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_event_entity DROP CONSTRAINT constraint_admin_event_entity;
       public            keycloak    false    307            �           2606    17604 1   authenticator_config_entry constraint_auth_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);
 [   ALTER TABLE ONLY public.authenticator_config_entry DROP CONSTRAINT constraint_auth_cfg_pk;
       public            keycloak    false    311    311            �           2606    17602 0   authentication_execution constraint_auth_exec_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT constraint_auth_exec_pk;
       public            keycloak    false    310            �           2606    17600 +   authentication_flow constraint_auth_flow_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT constraint_auth_flow_pk;
       public            keycloak    false    309            �           2606    17598 '   authenticator_config constraint_auth_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT constraint_auth_pk;
       public            keycloak    false    308            �           2606    17608 4   client_session_auth_status constraint_auth_status_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);
 ^   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT constraint_auth_status_pk;
       public            keycloak    false    314    314            s           2606    17089    user_role_mapping constraint_c 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);
 H   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT constraint_c;
       public            keycloak    false    288    288            8           2606    18244 (   composite_role constraint_composite_role 
   CONSTRAINT     y   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);
 R   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT constraint_composite_role;
       public            keycloak    false    271    271            �           2606    17485 /   client_session_prot_mapper constraint_cs_pmp_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);
 Y   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT constraint_cs_pmp_pk;
       public            keycloak    false    306    306            �           2606    17369 %   identity_provider_config constraint_d 
   CONSTRAINT     {   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);
 O   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT constraint_d;
       public            keycloak    false    298    298                       2606    17957    policy_config constraint_dpc 
   CONSTRAINT     g   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);
 F   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT constraint_dpc;
       public            keycloak    false    332    332            U           2606    17091    realm_smtp_config constraint_e 
   CONSTRAINT     h   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);
 H   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT constraint_e;
       public            keycloak    false    279    279            <           2606    17093    credential constraint_f 
   CONSTRAINT     U   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.credential DROP CONSTRAINT constraint_f;
       public            keycloak    false    272            k           2606    17095 $   user_federation_config constraint_f9 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);
 N   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT constraint_f9;
       public            keycloak    false    285    285            D           2606    18386 ,   resource_server_perm_ticket constraint_fapmt 
   CONSTRAINT     j   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT constraint_fapmt;
       public            keycloak    false    353            �           2606    17912 )   resource_server_resource constraint_farsr 
   CONSTRAINT     g   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT constraint_farsr;
       public            keycloak    false    329            �           2606    17942 (   resource_server_policy constraint_farsrp 
   CONSTRAINT     f   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT constraint_farsrp;
       public            keycloak    false    331                       2606    18012 %   associated_policy constraint_farsrpap 
   CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);
 O   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT constraint_farsrpap;
       public            keycloak    false    336    336                       2606    17982 "   resource_policy constraint_farsrpp 
   CONSTRAINT     t   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);
 L   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT constraint_farsrpp;
       public            keycloak    false    334    334            �           2606    17927 '   resource_server_scope constraint_farsrs 
   CONSTRAINT     e   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT constraint_farsrs;
       public            keycloak    false    330                       2606    17967 !   resource_scope constraint_farsrsp 
   CONSTRAINT     r   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);
 K   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT constraint_farsrsp;
       public            keycloak    false    333    333            	           2606    17997     scope_policy constraint_farsrsps 
   CONSTRAINT     o   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);
 J   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT constraint_farsrsps;
       public            keycloak    false    335    335            c           2606    17097    user_entity constraint_fb 
   CONSTRAINT     W   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT constraint_fb;
       public            keycloak    false    284            �           2606    17612 9   user_federation_mapper_config constraint_fedmapper_cfg_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);
 c   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT constraint_fedmapper_cfg_pm;
       public            keycloak    false    313    313            �           2606    17610 -   user_federation_mapper constraint_fedmapperpm 
   CONSTRAINT     k   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT constraint_fedmapperpm;
       public            keycloak    false    312            B           2606    18371 6   fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 `   ALTER TABLE ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT constraint_fgrntcsnt_clsc_pm;
       public            keycloak    false    352    352            ?           2606    18361 5   user_consent_client_scope constraint_grntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 _   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT constraint_grntcsnt_clsc_pm;
       public            keycloak    false    351    351            �           2606    17479 #   user_consent constraint_grntcsnt_pm 
   CONSTRAINT     a   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT constraint_grntcsnt_pm;
       public            keycloak    false    305            �           2606    17760    keycloak_group constraint_group 
   CONSTRAINT     ]   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT constraint_group;
       public            keycloak    false    320            �           2606    17767 -   group_attribute constraint_group_attribute_pk 
   CONSTRAINT     k   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT constraint_group_attribute_pk;
       public            keycloak    false    322            �           2606    17781 (   group_role_mapping constraint_group_role 
   CONSTRAINT     u   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);
 R   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT constraint_group_role;
       public            keycloak    false    321    321            �           2606    17475 (   identity_provider_mapper constraint_idpm 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT constraint_idpm;
       public            keycloak    false    303            �           2606    17661 '   idp_mapper_config constraint_idpmconfig 
   CONSTRAINT     v   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);
 Q   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT constraint_idpmconfig;
       public            keycloak    false    304    304            �           2606    17473 !   migration_model constraint_migmod 
   CONSTRAINT     _   ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.migration_model DROP CONSTRAINT constraint_migmod;
       public            keycloak    false    302            �           2606    18467 1   offline_client_session constraint_offl_cl_ses_pk3 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);
 [   ALTER TABLE ONLY public.offline_client_session DROP CONSTRAINT constraint_offl_cl_ses_pk3;
       public            keycloak    false    319    319    319    319    319            �           2606    17736 /   offline_user_session constraint_offl_us_ses_pk2 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);
 Y   ALTER TABLE ONLY public.offline_user_session DROP CONSTRAINT constraint_offl_us_ses_pk2;
       public            keycloak    false    318    318            �           2606    17363    protocol_mapper constraint_pcm 
   CONSTRAINT     \   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT constraint_pcm;
       public            keycloak    false    294            �           2606    17654 *   protocol_mapper_config constraint_pmconfig 
   CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);
 T   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT constraint_pmconfig;
       public            keycloak    false    295    295            W           2606    18269 &   redirect_uris constraint_redirect_uris 
   CONSTRAINT     r   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);
 P   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT constraint_redirect_uris;
       public            keycloak    false    280    280            �           2606    17697 0   required_action_config constraint_req_act_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);
 Z   ALTER TABLE ONLY public.required_action_config DROP CONSTRAINT constraint_req_act_cfg_pk;
       public            keycloak    false    317    317            �           2606    17695 2   required_action_provider constraint_req_act_prv_pk 
   CONSTRAINT     p   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT constraint_req_act_prv_pk;
       public            keycloak    false    316            p           2606    17606 /   user_required_action constraint_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);
 Y   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT constraint_required_action;
       public            keycloak    false    287    287            J           2606    18434 '   resource_uris constraint_resour_uris_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);
 Q   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT constraint_resour_uris_pk;
       public            keycloak    false    355    355            L           2606    18442 +   role_attribute constraint_role_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT constraint_role_attribute_pk;
       public            keycloak    false    356            _           2606    17693 +   user_attribute constraint_user_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT constraint_user_attribute_pk;
       public            keycloak    false    283            �           2606    17774 +   user_group_membership constraint_user_group 
   CONSTRAINT     x   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);
 U   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT constraint_user_group;
       public            keycloak    false    323    323            �           2606    17373 #   user_session_note constraint_usn_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);
 M   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT constraint_usn_pk;
       public            keycloak    false    300    300            x           2606    18271 "   web_origins constraint_web_origins 
   CONSTRAINT     n   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);
 L   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT constraint_web_origins;
       public            keycloak    false    290    290            ,           2606    16892 0   databasechangeloglock databasechangeloglock_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
       public            keycloak    false    266            �           2606    16472    user email_unq2 
   CONSTRAINT     M   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT email_unq2 UNIQUE (email);
 ;   ALTER TABLE ONLY public."user" DROP CONSTRAINT email_unq2;
       public            keycloak    false    236            �           2606    16484    group group_pk 
   CONSTRAINT     S   ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pk PRIMARY KEY (groupid);
 :   ALTER TABLE ONLY public."group" DROP CONSTRAINT group_pk;
       public            keycloak    false    237            �           2606    16486    group group_unq 
   CONSTRAINT     [   ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_unq UNIQUE (name, orgid, userid);
 ;   ALTER TABLE ONLY public."group" DROP CONSTRAINT group_unq;
       public            keycloak    false    237    237    237            &           2606    16844    invoice invoice_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pk PRIMARY KEY (invoiceid);
 <   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pk;
       public            keycloak    false    261            �           2606    16516    location location_pk 
   CONSTRAINT     S   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pk PRIMARY KEY (cid);
 >   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pk;
       public            keycloak    false    239                       2606    16734    notifications notifications_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pk PRIMARY KEY (notificationid);
 H   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pk;
       public            keycloak    false    252            �           2606    16457 
   org org_pk 
   CONSTRAINT     K   ALTER TABLE ONLY public.org
    ADD CONSTRAINT org_pk PRIMARY KEY (orgid);
 4   ALTER TABLE ONLY public.org DROP CONSTRAINT org_pk;
       public            keycloak    false    235            �           2606    16459    org org_unq 
   CONSTRAINT     N   ALTER TABLE ONLY public.org
    ADD CONSTRAINT org_unq UNIQUE (orgshortname);
 5   ALTER TABLE ONLY public.org DROP CONSTRAINT org_unq;
       public            keycloak    false    235                        2606    16819 +   orgdatausagedetails orgdatausagedetails_pk1 
   CONSTRAINT     |   ALTER TABLE ONLY public.orgdatausagedetails
    ADD CONSTRAINT orgdatausagedetails_pk1 PRIMARY KEY (orgdatausagedetailsid);
 U   ALTER TABLE ONLY public.orgdatausagedetails DROP CONSTRAINT orgdatausagedetails_pk1;
       public            keycloak    false    259                       2606    16793    orgdetails orgdetails_pk1 
   CONSTRAINT     a   ALTER TABLE ONLY public.orgdetails
    ADD CONSTRAINT orgdetails_pk1 PRIMARY KEY (orgdetailsid);
 C   ALTER TABLE ONLY public.orgdetails DROP CONSTRAINT orgdetails_pk1;
       public            keycloak    false    257                       2606    16759    paymenttransactions payment_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.paymenttransactions
    ADD CONSTRAINT payment_pk PRIMARY KEY (paymenttransid);
 H   ALTER TABLE ONLY public.paymenttransactions DROP CONSTRAINT payment_pk;
       public            keycloak    false    254            �           2606    16610    permission permission_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pk PRIMARY KEY (permissionid);
 B   ALTER TABLE ONLY public.permission DROP CONSTRAINT permission_pk;
       public            keycloak    false    245            �           2606    17879 '   client_scope_attributes pk_cl_tmpl_attr 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);
 Q   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT pk_cl_tmpl_attr;
       public            keycloak    false    326    326            �           2606    17838    client_scope pk_cli_template 
   CONSTRAINT     Z   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT pk_cli_template;
       public            keycloak    false    325            �           2606    18224 "   resource_server pk_resource_server 
   CONSTRAINT     `   ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.resource_server DROP CONSTRAINT pk_resource_server;
       public            keycloak    false    328            �           2606    17867 +   client_scope_role_mapping pk_template_scope 
   CONSTRAINT     x   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);
 U   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT pk_template_scope;
       public            keycloak    false    327    327                       2606    16745    publicdomain publicdomain_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.publicdomain
    ADD CONSTRAINT publicdomain_pk PRIMARY KEY (domainid);
 F   ALTER TABLE ONLY public.publicdomain DROP CONSTRAINT publicdomain_pk;
       public            keycloak    false    253                       2606    16747    publicdomain publicdomain_unq 
   CONSTRAINT     Z   ALTER TABLE ONLY public.publicdomain
    ADD CONSTRAINT publicdomain_unq UNIQUE (domain);
 G   ALTER TABLE ONLY public.publicdomain DROP CONSTRAINT publicdomain_unq;
       public            keycloak    false    253            =           2606    18346 )   default_client_scope r_def_cli_scope_bind 
   CONSTRAINT     w   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);
 S   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT r_def_cli_scope_bind;
       public            keycloak    false    350    350            O           2606    18486 ,   realm_localizations realm_localizations_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);
 V   ALTER TABLE ONLY public.realm_localizations DROP CONSTRAINT realm_localizations_pkey;
       public            keycloak    false    357    357            *           2606    16885    requestdata requestdata_pk1 
   CONSTRAINT     `   ALTER TABLE ONLY public.requestdata
    ADD CONSTRAINT requestdata_pk1 PRIMARY KEY (requestid);
 E   ALTER TABLE ONLY public.requestdata DROP CONSTRAINT requestdata_pk1;
       public            keycloak    false    265            H           2606    18414    resource_attribute res_attr_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT res_attr_pk;
       public            keycloak    false    354            �           2606    16565    resource resource_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pk PRIMARY KEY (resourceid);
 >   ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_pk;
       public            keycloak    false    242            �           2606    16587 *   resourcetransaction resourcetransaction_pk 
   CONSTRAINT     {   ALTER TABLE ONLY public.resourcetransaction
    ADD CONSTRAINT resourcetransaction_pk PRIMARY KEY (resourcetransactionid);
 T   ALTER TABLE ONLY public.resourcetransaction DROP CONSTRAINT resourcetransaction_pk;
       public            keycloak    false    243            �           2606    16598 "   resourceversion resourceversion_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.resourceversion
    ADD CONSTRAINT resourceversion_pk PRIMARY KEY (resourceversionid);
 L   ALTER TABLE ONLY public.resourceversion DROP CONSTRAINT resourceversion_pk;
       public            keycloak    false    244            �           2606    16503    role role_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (roleid);
 6   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pk;
       public            keycloak    false    238            �           2606    16505    role rolename_unq 
   CONSTRAINT     P   ALTER TABLE ONLY public.role
    ADD CONSTRAINT rolename_unq UNIQUE (rolename);
 ;   ALTER TABLE ONLY public.role DROP CONSTRAINT rolename_unq;
       public            keycloak    false    238                        2606    16617 "   rolepermissions rolepermissions_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.rolepermissions
    ADD CONSTRAINT rolepermissions_pk PRIMARY KEY (rolepermissionid);
 L   ALTER TABLE ONLY public.rolepermissions DROP CONSTRAINT rolepermissions_pk;
       public            keycloak    false    246            �           2606    16532     sharedlocation sharedlocation_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.sharedlocation
    ADD CONSTRAINT sharedlocation_pk PRIMARY KEY (cid);
 J   ALTER TABLE ONLY public.sharedlocation DROP CONSTRAINT sharedlocation_pk;
       public            keycloak    false    240                       2606    16693     sharedresource sharedresource_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.sharedresource
    ADD CONSTRAINT sharedresource_pk PRIMARY KEY (sharedresourceid);
 J   ALTER TABLE ONLY public.sharedresource DROP CONSTRAINT sharedresource_pk;
       public            keycloak    false    251            �           2606    18153    keycloak_group sibling_names 
   CONSTRAINT     o   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);
 F   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT sibling_names;
       public            keycloak    false    320    320    320                       2606    16769    subscriptions subscription_pk 
   CONSTRAINT     g   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscription_pk PRIMARY KEY (subscriptionid);
 G   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscription_pk;
       public            keycloak    false    255                       2606    16650    systemrole systemrole_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.systemrole
    ADD CONSTRAINT systemrole_pk PRIMARY KEY (systemroleid);
 B   ALTER TABLE ONLY public.systemrole DROP CONSTRAINT systemrole_pk;
       public            keycloak    false    248                       2606    16652    systemrole systemrolename_unq 
   CONSTRAINT     \   ALTER TABLE ONLY public.systemrole
    ADD CONSTRAINT systemrolename_unq UNIQUE (rolename);
 G   ALTER TABLE ONLY public.systemrole DROP CONSTRAINT systemrolename_unq;
       public            keycloak    false    248            �           2606    17420 /   identity_provider uk_2daelwnibji49avxsrtuf6xj33 
   CONSTRAINT     ~   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);
 Y   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33;
       public            keycloak    false    297    297            1           2606    17101 #   client uk_b71cjlbenv945rb6gcon438at 
   CONSTRAINT     m   ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);
 M   ALTER TABLE ONLY public.client DROP CONSTRAINT uk_b71cjlbenv945rb6gcon438at;
       public            keycloak    false    268    268            �           2606    18299    client_scope uk_cli_scope 
   CONSTRAINT     ^   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);
 C   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT uk_cli_scope;
       public            keycloak    false    325    325            g           2606    17105 (   user_entity uk_dykn684sl8up1crfei6eckhd7 
   CONSTRAINT     y   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_dykn684sl8up1crfei6eckhd7;
       public            keycloak    false    284    284            �           2606    18476 4   resource_server_resource uk_frsr6t700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);
 ^   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6;
       public            keycloak    false    329    329    329            F           2606    18471 7   resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);
 a   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt;
       public            keycloak    false    353    353    353    353    353            �           2606    18215 2   resource_server_policy uk_frsrpt700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 \   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6;
       public            keycloak    false    331    331            �           2606    18219 1   resource_server_scope uk_frsrst700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 [   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT uk_frsrst700s9v50bu18ws5ha6;
       public            keycloak    false    330    330            �           2606    18462 )   user_consent uk_jkuwuvd56ontgsuhogm8uewrt 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);
 S   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt;
       public            keycloak    false    305    305    305    305            K           2606    17113 "   realm uk_orvsdmla56612eaefiq6wl5oi 
   CONSTRAINT     ]   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);
 L   ALTER TABLE ONLY public.realm DROP CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi;
       public            keycloak    false    275            i           2606    18142 (   user_entity uk_ru8tt6t700s9v50bu18ws5ha6 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6;
       public            keycloak    false    284    284            �           2606    16468    user user_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (userid);
 8   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pk;
       public            keycloak    false    236                       2606    16806 -   userdatausagedetails userdatausagedetails_pk1 
   CONSTRAINT        ALTER TABLE ONLY public.userdatausagedetails
    ADD CONSTRAINT userdatausagedetails_pk1 PRIMARY KEY (userdatausagedetailsid);
 W   ALTER TABLE ONLY public.userdatausagedetails DROP CONSTRAINT userdatausagedetails_pk1;
       public            keycloak    false    258            
           2606    16674    usergroups usergroups_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_pk PRIMARY KEY (usergroupsid);
 B   ALTER TABLE ONLY public.usergroups DROP CONSTRAINT usergroups_pk;
       public            keycloak    false    250                       2606    16676    usergroups usergroups_unq 
   CONSTRAINT     _   ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_unq UNIQUE (userid, groupid);
 C   ALTER TABLE ONLY public.usergroups DROP CONSTRAINT usergroups_unq;
       public            keycloak    false    250    250            �           2606    16470    user username_unq1 
   CONSTRAINT     Z   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT username_unq1 UNIQUE (username, orgid);
 >   ALTER TABLE ONLY public."user" DROP CONSTRAINT username_unq1;
       public            keycloak    false    236    236            (           2606    16850    usersrelation userrelation_pk1 
   CONSTRAINT     ]   ALTER TABLE ONLY public.usersrelation
    ADD CONSTRAINT userrelation_pk1 PRIMARY KEY (rid);
 H   ALTER TABLE ONLY public.usersrelation DROP CONSTRAINT userrelation_pk1;
       public            keycloak    false    262                       2606    16633    userroles userroles_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_pk PRIMARY KEY (userrolesid);
 @   ALTER TABLE ONLY public.userroles DROP CONSTRAINT userroles_pk;
       public            keycloak    false    247                       2606    16658 "   usersystemroles usersystemroles_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.usersystemroles
    ADD CONSTRAINT usersystemroles_pk PRIMARY KEY (usersystemrolesid);
 L   ALTER TABLE ONLY public.usersystemroles DROP CONSTRAINT usersystemroles_pk;
       public            keycloak    false    249            �           1259    18503    idx_admin_event_time    INDEX     i   CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);
 (   DROP INDEX public.idx_admin_event_time;
       public            keycloak    false    307    307                       1259    18167    idx_assoc_pol_assoc_pol_id    INDEX     h   CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);
 .   DROP INDEX public.idx_assoc_pol_assoc_pol_id;
       public            keycloak    false    336            �           1259    18172    idx_auth_config_realm    INDEX     Z   CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);
 )   DROP INDEX public.idx_auth_config_realm;
       public            keycloak    false    308            �           1259    18169    idx_auth_exec_flow    INDEX     Z   CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);
 &   DROP INDEX public.idx_auth_exec_flow;
       public            keycloak    false    310            �           1259    18168    idx_auth_exec_realm_flow    INDEX     j   CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);
 ,   DROP INDEX public.idx_auth_exec_realm_flow;
       public            keycloak    false    310    310            �           1259    18170    idx_auth_flow_realm    INDEX     W   CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);
 '   DROP INDEX public.idx_auth_flow_realm;
       public            keycloak    false    309            8           1259    18493    idx_cl_clscope    INDEX     R   CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);
 "   DROP INDEX public.idx_cl_clscope;
       public            keycloak    false    349            /           1259    18477    idx_client_id    INDEX     E   CREATE INDEX idx_client_id ON public.client USING btree (client_id);
 !   DROP INDEX public.idx_client_id;
       public            keycloak    false    268            3           1259    18212    idx_client_init_acc_realm    INDEX     _   CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);
 -   DROP INDEX public.idx_client_init_acc_realm;
       public            keycloak    false    347            4           1259    18176    idx_client_session_session    INDEX     [   CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);
 .   DROP INDEX public.idx_client_session_session;
       public            keycloak    false    269            �           1259    18376    idx_clscope_attrs    INDEX     Y   CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);
 %   DROP INDEX public.idx_clscope_attrs;
       public            keycloak    false    326            9           1259    18490    idx_clscope_cl    INDEX     S   CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);
 "   DROP INDEX public.idx_clscope_cl;
       public            keycloak    false    349            �           1259    18373    idx_clscope_protmap    INDEX     Z   CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);
 '   DROP INDEX public.idx_clscope_protmap;
       public            keycloak    false    294            �           1259    18374    idx_clscope_role    INDEX     Z   CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);
 $   DROP INDEX public.idx_clscope_role;
       public            keycloak    false    327            *           1259    18178    idx_compo_config_compo    INDEX     [   CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);
 *   DROP INDEX public.idx_compo_config_compo;
       public            keycloak    false    344            -           1259    18449    idx_component_provider_type    INDEX     Z   CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);
 /   DROP INDEX public.idx_component_provider_type;
       public            keycloak    false    345            .           1259    18177    idx_component_realm    INDEX     M   CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);
 '   DROP INDEX public.idx_component_realm;
       public            keycloak    false    345            9           1259    18179    idx_composite    INDEX     M   CREATE INDEX idx_composite ON public.composite_role USING btree (composite);
 !   DROP INDEX public.idx_composite;
       public            keycloak    false    271            :           1259    18180    idx_composite_child    INDEX     T   CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);
 '   DROP INDEX public.idx_composite_child;
       public            keycloak    false    271            :           1259    18379    idx_defcls_realm    INDEX     U   CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);
 $   DROP INDEX public.idx_defcls_realm;
       public            keycloak    false    350            ;           1259    18380    idx_defcls_scope    INDEX     U   CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);
 $   DROP INDEX public.idx_defcls_scope;
       public            keycloak    false    350            @           1259    18478    idx_event_time    INDEX     W   CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);
 "   DROP INDEX public.idx_event_time;
       public            keycloak    false    273    273            �           1259    17896    idx_fedidentity_feduser    INDEX     c   CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);
 +   DROP INDEX public.idx_fedidentity_feduser;
       public            keycloak    false    296            �           1259    17895    idx_fedidentity_user    INDEX     V   CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);
 (   DROP INDEX public.idx_fedidentity_user;
       public            keycloak    false    296                       1259    18272    idx_fu_attribute    INDEX     b   CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);
 $   DROP INDEX public.idx_fu_attribute;
       public            keycloak    false    338    338    338                       1259    18293    idx_fu_cnsnt_ext    INDEX     }   CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);
 $   DROP INDEX public.idx_fu_cnsnt_ext;
       public            keycloak    false    339    339    339                       1259    18458    idx_fu_consent    INDEX     Y   CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);
 "   DROP INDEX public.idx_fu_consent;
       public            keycloak    false    339    339                       1259    18274    idx_fu_consent_ru    INDEX     [   CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);
 %   DROP INDEX public.idx_fu_consent_ru;
       public            keycloak    false    339    339                       1259    18275    idx_fu_credential    INDEX     Z   CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);
 %   DROP INDEX public.idx_fu_credential;
       public            keycloak    false    340    340                       1259    18276    idx_fu_credential_ru    INDEX     a   CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);
 (   DROP INDEX public.idx_fu_credential_ru;
       public            keycloak    false    340    340                       1259    18277    idx_fu_group_membership    INDEX     j   CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);
 +   DROP INDEX public.idx_fu_group_membership;
       public            keycloak    false    341    341                       1259    18278    idx_fu_group_membership_ru    INDEX     m   CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);
 .   DROP INDEX public.idx_fu_group_membership_ru;
       public            keycloak    false    341    341            "           1259    18279    idx_fu_required_action    INDEX     o   CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);
 *   DROP INDEX public.idx_fu_required_action;
       public            keycloak    false    342    342            #           1259    18280    idx_fu_required_action_ru    INDEX     k   CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);
 -   DROP INDEX public.idx_fu_required_action_ru;
       public            keycloak    false    342    342            &           1259    18281    idx_fu_role_mapping    INDEX     a   CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);
 '   DROP INDEX public.idx_fu_role_mapping;
       public            keycloak    false    343    343            '           1259    18282    idx_fu_role_mapping_ru    INDEX     e   CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);
 *   DROP INDEX public.idx_fu_role_mapping_ru;
       public            keycloak    false    343    343            �           1259    18504    idx_group_att_by_name_value    INDEX     z   CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));
 /   DROP INDEX public.idx_group_att_by_name_value;
       public            keycloak    false    322    322            �           1259    18183    idx_group_attr_group    INDEX     T   CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);
 (   DROP INDEX public.idx_group_attr_group;
       public            keycloak    false    322            �           1259    18184    idx_group_role_mapp_group    INDEX     \   CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);
 -   DROP INDEX public.idx_group_role_mapp_group;
       public            keycloak    false    321            �           1259    18186    idx_id_prov_mapp_realm    INDEX     _   CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);
 *   DROP INDEX public.idx_id_prov_mapp_realm;
       public            keycloak    false    303            �           1259    18185    idx_ident_prov_realm    INDEX     V   CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);
 (   DROP INDEX public.idx_ident_prov_realm;
       public            keycloak    false    297            E           1259    18187    idx_keycloak_role_client    INDEX     T   CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);
 ,   DROP INDEX public.idx_keycloak_role_client;
       public            keycloak    false    274            F           1259    18188    idx_keycloak_role_realm    INDEX     R   CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);
 +   DROP INDEX public.idx_keycloak_role_realm;
       public            keycloak    false    274            �           1259    18497    idx_offline_css_preload    INDEX     m   CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);
 +   DROP INDEX public.idx_offline_css_preload;
       public            keycloak    false    319    319            �           1259    18498    idx_offline_uss_by_user    INDEX     s   CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);
 +   DROP INDEX public.idx_offline_uss_by_user;
       public            keycloak    false    318    318    318            �           1259    18499    idx_offline_uss_by_usersess    INDEX        CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);
 /   DROP INDEX public.idx_offline_uss_by_usersess;
       public            keycloak    false    318    318    318            �           1259    18453    idx_offline_uss_createdon    INDEX     `   CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);
 -   DROP INDEX public.idx_offline_uss_createdon;
       public            keycloak    false    318            �           1259    18487    idx_offline_uss_preload    INDEX     }   CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);
 +   DROP INDEX public.idx_offline_uss_preload;
       public            keycloak    false    318    318    318            �           1259    18189    idx_protocol_mapper_client    INDEX     [   CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);
 .   DROP INDEX public.idx_protocol_mapper_client;
       public            keycloak    false    294            N           1259    18192    idx_realm_attr_realm    INDEX     T   CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);
 (   DROP INDEX public.idx_realm_attr_realm;
       public            keycloak    false    276            �           1259    18372    idx_realm_clscope    INDEX     N   CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);
 %   DROP INDEX public.idx_realm_clscope;
       public            keycloak    false    325            �           1259    18193    idx_realm_def_grp_realm    INDEX     \   CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);
 +   DROP INDEX public.idx_realm_def_grp_realm;
       public            keycloak    false    324            Q           1259    18196    idx_realm_evt_list_realm    INDEX     _   CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);
 ,   DROP INDEX public.idx_realm_evt_list_realm;
       public            keycloak    false    277            �           1259    18195    idx_realm_evt_types_realm    INDEX     c   CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);
 -   DROP INDEX public.idx_realm_evt_types_realm;
       public            keycloak    false    301            I           1259    18191    idx_realm_master_adm_cli    INDEX     Y   CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);
 ,   DROP INDEX public.idx_realm_master_adm_cli;
       public            keycloak    false    275            �           1259    18197    idx_realm_supp_local_realm    INDEX     b   CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);
 .   DROP INDEX public.idx_realm_supp_local_realm;
       public            keycloak    false    299            X           1259    18198    idx_redir_uri_client    INDEX     S   CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);
 (   DROP INDEX public.idx_redir_uri_client;
       public            keycloak    false    280            �           1259    18199    idx_req_act_prov_realm    INDEX     _   CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);
 *   DROP INDEX public.idx_req_act_prov_realm;
       public            keycloak    false    316                       1259    18200    idx_res_policy_policy    INDEX     V   CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);
 )   DROP INDEX public.idx_res_policy_policy;
       public            keycloak    false    334                       1259    18201    idx_res_scope_scope    INDEX     R   CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);
 '   DROP INDEX public.idx_res_scope_scope;
       public            keycloak    false    333            �           1259    18220    idx_res_serv_pol_res_serv    INDEX     j   CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_serv_pol_res_serv;
       public            keycloak    false    331            �           1259    18221    idx_res_srv_res_res_srv    INDEX     j   CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);
 +   DROP INDEX public.idx_res_srv_res_res_srv;
       public            keycloak    false    329            �           1259    18222    idx_res_srv_scope_res_srv    INDEX     i   CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_srv_scope_res_srv;
       public            keycloak    false    330            M           1259    18448    idx_role_attribute    INDEX     P   CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);
 &   DROP INDEX public.idx_role_attribute;
       public            keycloak    false    356            �           1259    18375    idx_role_clscope    INDEX     Y   CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);
 $   DROP INDEX public.idx_role_clscope;
       public            keycloak    false    327            [           1259    18205    idx_scope_mapping_role    INDEX     S   CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);
 *   DROP INDEX public.idx_scope_mapping_role;
       public            keycloak    false    281            
           1259    18206    idx_scope_policy_policy    INDEX     U   CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);
 +   DROP INDEX public.idx_scope_policy_policy;
       public            keycloak    false    335            �           1259    18456    idx_update_time    INDEX     R   CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);
 #   DROP INDEX public.idx_update_time;
       public            keycloak    false    302            �           1259    17885    idx_us_sess_id_on_cl_sess    INDEX     g   CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);
 -   DROP INDEX public.idx_us_sess_id_on_cl_sess;
       public            keycloak    false    319            @           1259    18381    idx_usconsent_clscope    INDEX     f   CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);
 )   DROP INDEX public.idx_usconsent_clscope;
       public            keycloak    false    351            `           1259    17892    idx_user_attribute    INDEX     P   CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);
 &   DROP INDEX public.idx_user_attribute;
       public            keycloak    false    283            a           1259    18501    idx_user_attribute_name    INDEX     Y   CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);
 +   DROP INDEX public.idx_user_attribute_name;
       public            keycloak    false    283    283            �           1259    17889    idx_user_consent    INDEX     L   CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);
 $   DROP INDEX public.idx_user_consent;
       public            keycloak    false    305            =           1259    17893    idx_user_credential    INDEX     M   CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);
 '   DROP INDEX public.idx_user_credential;
       public            keycloak    false    272            d           1259    17886    idx_user_email    INDEX     G   CREATE INDEX idx_user_email ON public.user_entity USING btree (email);
 "   DROP INDEX public.idx_user_email;
       public            keycloak    false    284            �           1259    17888    idx_user_group_mapping    INDEX     [   CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);
 *   DROP INDEX public.idx_user_group_mapping;
       public            keycloak    false    323            q           1259    17894    idx_user_reqactions    INDEX     W   CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);
 '   DROP INDEX public.idx_user_reqactions;
       public            keycloak    false    287            t           1259    17887    idx_user_role_mapping    INDEX     V   CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);
 )   DROP INDEX public.idx_user_role_mapping;
       public            keycloak    false    288            e           1259    18502    idx_user_service_account    INDEX     q   CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);
 ,   DROP INDEX public.idx_user_service_account;
       public            keycloak    false    284    284            �           1259    18208    idx_usr_fed_map_fed_prv    INDEX     l   CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);
 +   DROP INDEX public.idx_usr_fed_map_fed_prv;
       public            keycloak    false    312            �           1259    18209    idx_usr_fed_map_realm    INDEX     \   CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_map_realm;
       public            keycloak    false    312            n           1259    18210    idx_usr_fed_prv_realm    INDEX     ^   CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_prv_realm;
       public            keycloak    false    286            y           1259    18211    idx_web_orig_client    INDEX     P   CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);
 '   DROP INDEX public.idx_web_orig_client;
       public            keycloak    false    290            �           2606    17613 1   client_session_auth_status auth_status_constraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 [   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT auth_status_constraint;
       public          keycloak    false    3635    314    269            �           2606    17374 $   identity_provider fk2b4ebc52ae5c3b34    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 N   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT fk2b4ebc52ae5c3b34;
       public          keycloak    false    275    297    3656            �           2606    17298 $   client_attributes fk3c47c64beacca966    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);
 N   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT fk3c47c64beacca966;
       public          keycloak    false    3630    268    291            �           2606    17384 %   federated_identity fk404288b92ef007a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 O   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT fk404288b92ef007a6;
       public          keycloak    false    284    296    3683            �           2606    17533 ,   client_node_registrations fk4129723ba992f594    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);
 V   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT fk4129723ba992f594;
       public          keycloak    false    268    293    3630            �           2606    17303 &   client_session_note fk5edfb00ff51c2736    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 P   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT fk5edfb00ff51c2736;
       public          keycloak    false    292    269    3635            �           2606    17414 $   user_session_note fk5edfb00ff51d3472    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);
 N   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT fk5edfb00ff51d3472;
       public          keycloak    false    300    289    3702            o           2606    17116 0   client_session_role fk_11b7sgqw18i532811v7o2dv76    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 Z   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT fk_11b7sgqw18i532811v7o2dv76;
       public          keycloak    false    270    3635    269            x           2606    17121 *   redirect_uris fk_1burs8pb4ouj97h5wuppahv9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f;
       public          keycloak    false    268    3630    280            |           2606    17126 5   user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 _   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8;
       public          keycloak    false    286    3656    275            �           2606    17511 7   client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 a   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT fk_33a8sgqw18i532811v7o2dk89;
       public          keycloak    false    269    3635    306            v           2606    17136 6   realm_required_credential fk_5hg65lybevavkqfki3kponh9v    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT fk_5hg65lybevavkqfki3kponh9v;
       public          keycloak    false    278    3656    275            �           2606    18415 /   resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 Y   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr;
       public          keycloak    false    354    3826    329            z           2606    17141 +   user_attribute fk_5hrm2vlf9ql5fu043kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr;
       public          keycloak    false    3683    283    284            }           2606    17151 1   user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 [   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd;
       public          keycloak    false    3683    284    287            s           2606    17156 *   keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);
 T   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
       public          keycloak    false    274    275    3656            w           2606    17161 .   realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o;
       public          keycloak    false    3656    275    279            t           2606    17176 ,   realm_attribute fk_8shxd6l3e9atqukacxgpffptw    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 V   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw;
       public          keycloak    false    3656    276    275            p           2606    17181 +   composite_role fk_a63wvekftu8jo1pnj81e7mce2    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2;
       public          keycloak    false    271    3652    274            �           2606    17633 *   authentication_execution fk_auth_exec_flow    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);
 T   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_flow;
       public          keycloak    false    3759    310    309            �           2606    17628 +   authentication_execution fk_auth_exec_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_realm;
       public          keycloak    false    3656    310    275            �           2606    17623 &   authentication_flow fk_auth_flow_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT fk_auth_flow_realm;
       public          keycloak    false    309    275    3656            �           2606    17618 "   authenticator_config fk_auth_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 L   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT fk_auth_realm;
       public          keycloak    false    3656    308    275            n           2606    17186 +   client_session fk_b4ao2vcvat6ukau74wbwtfqo1    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);
 U   ALTER TABLE ONLY public.client_session DROP CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1;
       public          keycloak    false    269    3702    289            ~           2606    17191 .   user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 X   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l;
       public          keycloak    false    288    3683    284            �           2606    18320 .   client_scope_attributes fk_cl_scope_attr_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT fk_cl_scope_attr_scope;
       public          keycloak    false    325    326    3813            �           2606    18310 .   client_scope_role_mapping fk_cl_scope_rm_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT fk_cl_scope_rm_scope;
       public          keycloak    false    3813    327    325            �           2606    17705 +   client_user_session_note fk_cl_usr_ses_note    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 U   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT fk_cl_usr_ses_note;
       public          keycloak    false    3635    315    269            �           2606    18305 #   protocol_mapper fk_cli_scope_mapper    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);
 M   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_cli_scope_mapper;
       public          keycloak    false    3813    325    294            �           2606    18162 .   client_initial_access fk_client_init_acc_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT fk_client_init_acc_realm;
       public          keycloak    false    347    3656    275            �           2606    18106 $   component_config fk_component_config    FK CONSTRAINT     �   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);
 N   ALTER TABLE ONLY public.component_config DROP CONSTRAINT fk_component_config;
       public          keycloak    false    345    344    3884            �           2606    18101    component fk_component_realm    FK CONSTRAINT     |   ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 F   ALTER TABLE ONLY public.component DROP CONSTRAINT fk_component_realm;
       public          keycloak    false    275    345    3656            �           2606    17794 (   realm_default_groups fk_def_groups_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 R   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT fk_def_groups_realm;
       public          keycloak    false    3656    324    275            �           2606    17648 .   user_federation_mapper_config fk_fedmapper_cfg    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);
 X   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT fk_fedmapper_cfg;
       public          keycloak    false    313    3768    312            �           2606    17643 ,   user_federation_mapper fk_fedmapperpm_fedprv    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);
 V   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_fedprv;
       public          keycloak    false    286    3693    312            �           2606    17638 +   user_federation_mapper fk_fedmapperpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_realm;
       public          keycloak    false    275    3656    312            �           2606    18018 .   associated_policy fk_frsr5s213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy;
       public          keycloak    false    331    336    3836            �           2606    18003 )   scope_policy fk_frsrasp13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy;
       public          keycloak    false    335    331    3836            �           2606    18387 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog82sspmt;
       public          keycloak    false    3824    328    353            �           2606    18230 5   resource_server_resource fk_frsrho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 _   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy;
       public          keycloak    false    3824    328    329            �           2606    18392 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog83sspmt;
       public          keycloak    false    3826    329    353            �           2606    18397 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog84sspmt;
       public          keycloak    false    330    353    3831            �           2606    18013 .   associated_policy fk_frsrpas14xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy;
       public          keycloak    false    331    336    3836            �           2606    17998 )   scope_policy fk_frsrpass3xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy;
       public          keycloak    false    3831    335    330            �           2606    18420 8   resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy;
       public          keycloak    false    3836    353    331            �           2606    18225 3   resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 ]   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy;
       public          keycloak    false    328    3824    331            �           2606    17968 +   resource_scope fk_frsrpos13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy;
       public          keycloak    false    3826    333    329            �           2606    17983 ,   resource_policy fk_frsrpos53xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy;
       public          keycloak    false    329    334    3826            �           2606    17988 ,   resource_policy fk_frsrpp213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy;
       public          keycloak    false    331    334    3836            �           2606    17973 +   resource_scope fk_frsrps213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy;
       public          keycloak    false    330    333    3831            �           2606    18235 2   resource_server_scope fk_frsrso213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 \   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy;
       public          keycloak    false    3824    328    330            q           2606    17206 +   composite_role fk_gr7thllb9lu8q4vqa4524jjy8    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8;
       public          keycloak    false    274    271    3652            �           2606    18362 .   user_consent_client_scope fk_grntcsnt_clsc_usc    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);
 X   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT fk_grntcsnt_clsc_usc;
       public          keycloak    false    351    305    3746            �           2606    17496    user_consent fk_grntcsnt_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 G   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT fk_grntcsnt_user;
       public          keycloak    false    284    305    3683            �           2606    17768 (   group_attribute fk_group_attribute_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 R   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT fk_group_attribute_group;
       public          keycloak    false    320    322    3793            �           2606    17782 &   group_role_mapping fk_group_role_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 P   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT fk_group_role_group;
       public          keycloak    false    321    320    3793            �           2606    17440 6   realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j;
       public          keycloak    false    301    3656    275            u           2606    17216 3   realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 ]   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j;
       public          keycloak    false    277    275    3656            �           2606    17486 &   identity_provider_mapper fk_idpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT fk_idpm_realm;
       public          keycloak    false    275    3656    303            �           2606    17662    idp_mapper_config fk_idpmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);
 I   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT fk_idpmconfig;
       public          keycloak    false    3741    304    303                       2606    17226 (   web_origins fk_lojpho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);
 R   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy;
       public          keycloak    false    290    268    3630            y           2606    17236 *   scope_mapping fk_ouse064plmlr732lxjcn1q5f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1;
       public          keycloak    false    3630    268    281            �           2606    17379    protocol_mapper fk_pcm_realm    FK CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);
 F   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_pcm_realm;
       public          keycloak    false    268    294    3630            r           2606    17251 '   credential fk_pfyr0glasqyl0dei3kl69r6v0    FK CONSTRAINT     �   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 Q   ALTER TABLE ONLY public.credential DROP CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0;
       public          keycloak    false    284    3683    272            �           2606    17655 "   protocol_mapper_config fk_pmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);
 L   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT fk_pmconfig;
       public          keycloak    false    295    3713    294            �           2606    18347 -   default_client_scope fk_r_def_cli_scope_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 W   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT fk_r_def_cli_scope_realm;
       public          keycloak    false    350    275    3656            �           2606    17700 )   required_action_provider fk_req_act_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 S   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT fk_req_act_realm;
       public          keycloak    false    275    3656    316            �           2606    18428 %   resource_uris fk_resource_server_uris    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 O   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT fk_resource_server_uris;
       public          keycloak    false    3826    355    329            �           2606    18443 #   role_attribute fk_role_attribute_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);
 M   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT fk_role_attribute_id;
       public          keycloak    false    3652    356    274            �           2606    17409 2   realm_supported_locales fk_supported_locales_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 \   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT fk_supported_locales_realm;
       public          keycloak    false    275    3656    299            {           2606    17271 3   user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);
 ]   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5;
       public          keycloak    false    286    3693    285            �           2606    17775 (   user_group_membership fk_user_group_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 R   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT fk_user_group_user;
       public          keycloak    false    323    284    3683            �           2606    17958 !   policy_config fkdc34197cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 K   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT fkdc34197cf864c4e43;
       public          keycloak    false    331    332    3836            �           2606    17389 +   identity_provider_config fkdc4897cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);
 U   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT fkdc4897cf864c4e43;
       public          keycloak    false    3723    297    298            Q           2606    16487    group group_fk1    FK CONSTRAINT     o   ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_fk1 FOREIGN KEY (orgid) REFERENCES public.org(orgid);
 ;   ALTER TABLE ONLY public."group" DROP CONSTRAINT group_fk1;
       public          keycloak    false    237    235    3552            R           2606    16492    group group_fk2    FK CONSTRAINT     t   ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_fk2 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 ;   ALTER TABLE ONLY public."group" DROP CONSTRAINT group_fk2;
       public          keycloak    false    237    236    3558            S           2606    16517    location location_fk1    FK CONSTRAINT     x   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 ?   ALTER TABLE ONLY public.location DROP CONSTRAINT location_fk1;
       public          keycloak    false    3558    236    239            h           2606    16735    notifications notifications_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 I   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_fk1;
       public          keycloak    false    3558    252    236            k           2606    16820 +   orgdatausagedetails orgdatausagedetails_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.orgdatausagedetails
    ADD CONSTRAINT orgdatausagedetails_fk1 FOREIGN KEY (orgid) REFERENCES public.org(orgid);
 U   ALTER TABLE ONLY public.orgdatausagedetails DROP CONSTRAINT orgdatausagedetails_fk1;
       public          keycloak    false    235    3552    259            i           2606    16794    orgdetails orgdetails_fk1    FK CONSTRAINT     w   ALTER TABLE ONLY public.orgdetails
    ADD CONSTRAINT orgdetails_fk1 FOREIGN KEY (orgid) REFERENCES public.org(orgid);
 C   ALTER TABLE ONLY public.orgdetails DROP CONSTRAINT orgdetails_fk1;
       public          keycloak    false    257    3552    235            U           2606    16545    favouriteresource orgname_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.favouriteresource
    ADD CONSTRAINT orgname_fk1 FOREIGN KEY (orgname) REFERENCES public.org(orgshortname);
 G   ALTER TABLE ONLY public.favouriteresource DROP CONSTRAINT orgname_fk1;
       public          keycloak    false    241    235    3554            l           2606    16865    datareport orgname_fk1    FK CONSTRAINT     }   ALTER TABLE ONLY public.datareport
    ADD CONSTRAINT orgname_fk1 FOREIGN KEY (orgname) REFERENCES public.org(orgshortname);
 @   ALTER TABLE ONLY public.datareport DROP CONSTRAINT orgname_fk1;
       public          keycloak    false    3554    264    235            W           2606    16568    resource resource_fk1    FK CONSTRAINT     y   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_fk1 FOREIGN KEY (ownerid) REFERENCES public."user"(userid);
 ?   ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_fk1;
       public          keycloak    false    236    3558    242            X           2606    16573    resource resource_fk2    FK CONSTRAINT     v   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_fk2 FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 ?   ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_fk2;
       public          keycloak    false    238    3566    242            Y           2606    16599 #   resourceversion resourceversion_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.resourceversion
    ADD CONSTRAINT resourceversion_fk1 FOREIGN KEY (resourceid) REFERENCES public.resource(resourceid);
 M   ALTER TABLE ONLY public.resourceversion DROP CONSTRAINT resourceversion_fk1;
       public          keycloak    false    244    242    3576            Z           2606    16618 #   rolepermissions rolepermissions_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.rolepermissions
    ADD CONSTRAINT rolepermissions_fk1 FOREIGN KEY (permissionid) REFERENCES public.permission(permissionid);
 M   ALTER TABLE ONLY public.rolepermissions DROP CONSTRAINT rolepermissions_fk1;
       public          keycloak    false    3582    246    245            [           2606    16623 #   rolepermissions rolepermissions_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.rolepermissions
    ADD CONSTRAINT rolepermissions_fk2 FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 M   ALTER TABLE ONLY public.rolepermissions DROP CONSTRAINT rolepermissions_fk2;
       public          keycloak    false    238    3566    246            T           2606    16533 !   sharedlocation sharedlocation_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sharedlocation
    ADD CONSTRAINT sharedlocation_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 K   ALTER TABLE ONLY public.sharedlocation DROP CONSTRAINT sharedlocation_fk1;
       public          keycloak    false    240    236    3558            d           2606    16704 !   sharedresource sharedresource_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sharedresource
    ADD CONSTRAINT sharedresource_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 K   ALTER TABLE ONLY public.sharedresource DROP CONSTRAINT sharedresource_fk1;
       public          keycloak    false    251    3558    236            e           2606    16709 !   sharedresource sharedresource_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sharedresource
    ADD CONSTRAINT sharedresource_fk2 FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 K   ALTER TABLE ONLY public.sharedresource DROP CONSTRAINT sharedresource_fk2;
       public          keycloak    false    238    3566    251            f           2606    16714 !   sharedresource sharedresource_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.sharedresource
    ADD CONSTRAINT sharedresource_fk3 FOREIGN KEY (resourceid) REFERENCES public.resource(resourceid);
 K   ALTER TABLE ONLY public.sharedresource DROP CONSTRAINT sharedresource_fk3;
       public          keycloak    false    3576    242    251            g           2606    16719 !   sharedresource sharedresource_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.sharedresource
    ADD CONSTRAINT sharedresource_fk4 FOREIGN KEY (pid) REFERENCES public.sharedlocation(cid);
 K   ALTER TABLE ONLY public.sharedresource DROP CONSTRAINT sharedresource_fk4;
       public          keycloak    false    251    3572    240            c           2606    16699 &   sharedresource sharedresource_pid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sharedresource
    ADD CONSTRAINT sharedresource_pid_fkey FOREIGN KEY (pid) REFERENCES public.sharedlocation(cid);
 P   ALTER TABLE ONLY public.sharedresource DROP CONSTRAINT sharedresource_pid_fkey;
       public          keycloak    false    251    3572    240            b           2606    16694 -   sharedresource sharedresource_resourceid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sharedresource
    ADD CONSTRAINT sharedresource_resourceid_fkey FOREIGN KEY (resourceid) REFERENCES public.resource(resourceid);
 W   ALTER TABLE ONLY public.sharedresource DROP CONSTRAINT sharedresource_resourceid_fkey;
       public          keycloak    false    3576    251    242            P           2606    16473    user user_fk1    FK CONSTRAINT     m   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_fk1 FOREIGN KEY (orgid) REFERENCES public.org(orgid);
 9   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_fk1;
       public          keycloak    false    235    3552    236            j           2606    16807 -   userdatausagedetails userdatausagedetails_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.userdatausagedetails
    ADD CONSTRAINT userdatausagedetails_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 W   ALTER TABLE ONLY public.userdatausagedetails DROP CONSTRAINT userdatausagedetails_fk1;
       public          keycloak    false    258    236    3558            `           2606    16677    usergroups usergroups_fk1    FK CONSTRAINT     |   ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 C   ALTER TABLE ONLY public.usergroups DROP CONSTRAINT usergroups_fk1;
       public          keycloak    false    3558    250    236            a           2606    16682    usergroups usergroups_fk2    FK CONSTRAINT        ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_fk2 FOREIGN KEY (groupid) REFERENCES public."group"(groupid);
 C   ALTER TABLE ONLY public.usergroups DROP CONSTRAINT usergroups_fk2;
       public          keycloak    false    250    3562    237            V           2606    16550    favouriteresource username_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.favouriteresource
    ADD CONSTRAINT username_fk1 FOREIGN KEY (username) REFERENCES public."user"(email);
 H   ALTER TABLE ONLY public.favouriteresource DROP CONSTRAINT username_fk1;
       public          keycloak    false    3556    236    241            m           2606    16870    datareport username_fk1    FK CONSTRAINT     {   ALTER TABLE ONLY public.datareport
    ADD CONSTRAINT username_fk1 FOREIGN KEY (username) REFERENCES public."user"(email);
 A   ALTER TABLE ONLY public.datareport DROP CONSTRAINT username_fk1;
       public          keycloak    false    3556    264    236            \           2606    16634    userroles userroles_fk1    FK CONSTRAINT     z   ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 A   ALTER TABLE ONLY public.userroles DROP CONSTRAINT userroles_fk1;
       public          keycloak    false    247    236    3558            ]           2606    16639    userroles userroles_fk2    FK CONSTRAINT     x   ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_fk2 FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 A   ALTER TABLE ONLY public.userroles DROP CONSTRAINT userroles_fk2;
       public          keycloak    false    238    247    3566            ^           2606    16659 #   usersystemroles usersystemroles_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.usersystemroles
    ADD CONSTRAINT usersystemroles_fk1 FOREIGN KEY (userid) REFERENCES public."user"(userid);
 M   ALTER TABLE ONLY public.usersystemroles DROP CONSTRAINT usersystemroles_fk1;
       public          keycloak    false    249    3558    236            _           2606    16664 #   usersystemroles usersystemroles_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.usersystemroles
    ADD CONSTRAINT usersystemroles_fk2 FOREIGN KEY (systemroleid) REFERENCES public.systemrole(systemroleid);
 M   ALTER TABLE ONLY public.usersystemroles DROP CONSTRAINT usersystemroles_fk2;
       public          keycloak    false    248    3588    249            p   W   x�34 CNCN� _N���̜JN����NC#cS3sK���̲TN##]c]cK+#+S3=Cm|R1~\1z\\\ &��      l      x������ � �      �      x������ � �      �      x������ � �      �      x���[o�rǟ���A�/��	N� y�K_eƲ�P��|��j�"g��4{c�e-�k�����e�󲣩jgU���rJSS�+Y]������?������w�f�\lF�l���M՜/j�_f��o°iS��E+GW�����N��R����}������.T���.�G��DH*�UWnͤ��C�����p�����E�;{1Bq�7[T��+��t�k�甏ލ��������?�Ńz���a����w�&�c륇���i�����sRݮ�Cw��z��F����M�Χe���N��/U��j��j�z��$Ƙk,�Ɇ�|����EYks[S�8��Q��e>|��M��~�����P���c�
H�̖�ƨA9�C�R�*k%���5�k��PF���۠�-^9��p6Ie��bX:�X9@9���F֥,eR�(�o�X�U��в_�K���Ӹ{���T?n�H�~Zw~'	�(����=k�B~�I�N�jI<����R��d�?_q��ٕ��#NS��@��.9�Z�j�Q�D��v�[I��ӣ��~��q>�ݱ�Va�=����f�b�jK�Dv���V5gH-�4_�?��V�6�������ûF��;u�3j�r\]��W���Bȱ�pM���`���g�V�:;5�Wז�r��\5�ĨCnfԩl�I`d����mt+z�M��SG:;\@����-�pCS���A�e�z���R���\m�I{N��i��,��OJ�N�ԋ�{��<>T�6��ü�R�r��N@��lT�3�3y�:���N��x�r.�Ԧ\��Y�+'mT���4�0���sfcbUn:�}��e�y�ɭ�:��a?��W��H<g;�m�F��WP>I���Ս5��9��zG���ǩj����m`@�� :�8��>|�~�S�\���?�v��D�Lu9K��W�h��3�hk��UlK��������;l�O�2!���GD��͓�af
��|�ۄ^��E�_�ￜ��XpЪ����]W%���.��r�]`��s�H���	g�b�Ҧ�?Rp)���S�z��]�ڕAA���  ���3X��qȑ2\0�%����`4�%����ޅ�Я�P�f$A��h}}��H�=ޤn� }���[('Ō9���SO#thGB��)-����t��һ�ס��Ri4j�Ci`�4� Ѯ��%����a�����
���e6gx�!���h��Y0��&C��;�\}�����#���c`��A�P�*��r����Ì��7?l�-�A��7l���P5������ן��n[���0�����Rl�)9n8����-�Ю�R�i0�j�E�U�'�%Yq���e�������#��Z3H�8����^N����urpw�3|�����+�h��7�-5����Fŵ�,i��殚,�*���|��TΝ�1��j6�� �\��I��&� ��`I�B�I�5pu0��u�FUr@ʭ� �5%���aL��lj;T]Gri��'��Fڅ�9���}�4׉��R�����n�p^����"'���xa���L?*�a̭N�P�S��|g�A�|G�+��u��'r0�m{�#[�Щ��9,ۆ_#f�1ύ�Pc��ӉVӑG�<����}�^^�W��7���ӯ%��(�( _g���*��Ğ�Ҕ��2 �ƺj�F��YqΔ
�h����ĸC��bv��*[9ܺz2�����+ך��D�/�>�,ٳM��?��ݺ�W�C����e� �r_b�S�آ����#Gs���`�9��Վ1�O���yf����@ [����]⛨l`4Iq@��Y]�����=�C�����%��w�����6��W�ݡ�p�Ց(8M%�k�n��=N��l�m�%��|T��������َ�>�C�m�UĒ� Y ��ըsa���a���������R�h�V�f��Z���RwS�N��Gy$�V��Q��%v�=�#/}��O�@ߠYj$����Z���K�!�,z"y�e��J��
7fWM�0�f��_9��/�fS��,5{s�������T�88?��V0�$T�OD��������t���+��k��PlN����j���������43����pR	��qQ���l��5��*28�V��?VAkW#Z�w����~v���\�:ib�{���Nd�������Y?�f�_�X���?ۭ`���/��������%����P��9��2�D,�m�m��	޳-.�%9���ܛe�l2�k)�%�+A��O$�(&x�9����˿��Mse���4ɿ��hzV_kv��s:va�.��[H��������eJ|��+8�E̱�8U��z,���BT@"��a.��Y`~�������.a�j©a|��)��������t��+vy�q���I}�zA�%�Y��8A�L�V���&ZHg���wx���꾄�3���F�C����y��5�.늕vy�@�(�8�&�V�o����y<ǂ�G|++��:n"*VR�L ���KY���15:��L�gLe��(�`nx,��q�u�Z��)��]�B�d�#Q�ԓY�;�{�)��c`��t�&�<�Kq��[!-V.Ҧ����B�M4�R��*Yd)�Fy~���u��L5�Z�"Ԕ���0X3����]�z�4[��FZ��]��*���vA�sANI z��-���v.E�����s=���)cjq3=�j�v(o�_ȑ^<��ܐ8svۦ����i)����ge��aY�����zŖF5�D����WmK1}m}^���w��q�הc�[`��#c��E��`�I�]�P&��(�i�	mZ���|՚�Rٕ���#��3?�ԫ9�	�Q�i׸��c���t���Cߒ?�����.��1��o�Ⱥq�2Rh=�(Ԁ�YM�"~�O@{�� e-'��,�	�ۊ5j�a���n�8m�'� �8�6�-������p:�#�"�Y:���I~8AJ$��f������*����u6��w\K#�<Ao[��!x����-��){1�ٖ��!���uGԥc3�,OS'������s�[�����vf�|@�]t�H��Pi����F�#��WrR��[�{h�3���8�sT}h�)�q����U����q�+r7�T*�|�eJ;˶��U(�#�Z��`vl�m� S��Z����Hu�X�qX�f:#��$���Z���TUN��
!�]k��
B���b�^\O�U�oT�II�kŝ_����Ԛ"����Q��e�M�y�ח���/t3>@2�$�Jtz�B�`�9W�ꡮ]o��B�#�q���ӥw�@!D$k4�d���W��k��SS��mO6E�B~��~����Џ,n	��f��$��)�n�2i��.�G�hG���KY��@��E1�
'뿽�����}�61zcZ j�7�ҕ6�mQ]w�rh����C����vت��G��V�ؤ�LHؑ�ɫ����1�2 �&~#��}���|�ٔ�e['������ٖ!&O���ڑ0㹅~q�)��C�g@��@J��԰k��
e.�i \4��0 BJ����C���67�vH�EY�$�UTj��ݙac�C̽�ͮ�_U��tl E�E$CW)�?^�;t|/ϻF��!�e�����Q��1�T�@���-�DǇܕ(����[�3H�Bk�k3����iV�V�����a�$'Ӡd��|�s�6�I�B�dʿ',7`-�ʖW���q�<uv��85�f�����o
-���<�F��T�Z���~s�k;
�k
�٦�j�B�p�O��fl|��
q�����o�6��+��%�:gۙ(7��` u�R���ذ^z�UX�\ڡ���@x�� �(�G�yN��,w� ]x��ZW��㢌bw�]e�@���W.`�ji&������8���b��x��M���!�%div{4�m%�x�WK��:����T��֕���`�Y?�[�`_Lط��dmz���\]R�Sd&�l���6S�Ĝ��ז�B��A ��tК�o��4uŢ{7X52�B�H�h�Hs���ڴ�Ka�,zF�ۏZ�|ՏJ   y'�o�%\Q�|s��-�4�t�KM���Kb�,�^9�`��ma�|�^g�v#�:�nBY��vH=��c��l���Y��F����Xe��Q2���������?~������_o�4�0!jG�s3o��S��z�P�ť.�{锓{u��ĭA��C���Ӯ_���5+,��0{��HݦR2�M�n-��dK̐��}��2�!oy�6��μ������('�#ˮGY��靲in/ظY.��a��<:Q�":g��+s��8# f����*׮y~g�&\9��l����w,���
%�0Vk����wE���

b�cSQ�B�2����l�i?�X�Hە_�h�dj��H���c@;^膥�"��FyO��ָ��mv�����M���܏��3�F�y
p�%�Lx� 1��[�?���X|�	���%���Q��I�/ހ��Dj)]d�f�!�yD>2�!�o���$;��~��;2I���X�윹E��%���sB��orEOs �I��5���E�g�/���8s4���3�����*��������3?��~J����eb�
�d+�t$]�!���[�AB젥��*S�F��'�KS���S�{m�8�Cf�q9�eL�n�{�����О.�pݡ?D�/�h��а\��/���G�UwZ�V��'���(�o������q{]�+P��<����o_����v��>�^*�e_�bÎ�-���Fz��z�O�?�0����0�����{�*/�lV�O̚2��r
Y%Ɠ"��!����jm���ޭ�R�f��UJ$rĝ��m-�n��Ճ�l�q(��K��\w���Wi�qP�y�Q����7l�.�Cl~^$�-q�O�"ːQ�8����[;qh�'�|.�9gW
�Jը�.�Y#+��25ח�ݧ���	�RY�ka�/$"&>�5�ū��ŧt-�.ꅻ�IxN������C����q�0�� []��I�1[�!�Ѵ7?�h_�Ȼ�v�xt�v�6��M���Nw�������i\g�م���%Y=�']'�y(�*,���f���غ�2�)W�R�rű����V�>�>�_#�"E���)��m@Z���!�C+j�$(F�I�1g
m�}7X��ׯw�t�J�� ���k`4a��lxo��o\v���,)�U�[�F,�U&����®�}���~��,T�6��?í���_P��ۂ�����A��n���m�o(�07Ӵ�{9�豊�gÞ�sq8yk�zWBE~O���n����1��(���yo�5�ε1����.�C�<5��M+��`u�`�!.�yg���nO[q��!�S�̉���d�iR��I/>Nm�Y^�:�I��U�E�i�o��!~y��/ߡ��Wf���օEu�y>����TM�FD�S�t{���1Z:�A�Ƚ$/_��{�@ݜ>�V-:_��_d�z�P�_t��O�Q�u0��Q
�cŷZ�1)��=��KF�24�Q��v���||��6�\l��B��c٪jQ.�0�H3�7���:_���8�-gu�27�8`qd�������)�H���i?"Gk2�'���"���,�g�:���Y��̺�B�OCn��lDƷ7���:O�@_@(��Ȁ�����.�5a��6	T_��_:�{�I�Ք^�&���E׬��a�`��k#�d
F���!$eJQ	ٻ�jۆlo�9�^p8I$���8V�Hj���Wѝ7�wZ�|N���]/*E#w/���R��0j������ӯ`���l取�Cj�X��������~�x����G�y�.lgϓ2z�W���c�*���J�Uw��Κ�2�e���i�]��Գ�v����o5�ϴe�7�oڭ8�s�[�R�8�x�X�d���*�(�YН"?`V��
��~����6��m&sR��.���q9\������oɊ�k��P�q�5l�Z?���M�6�� �C�<5���v�u�CQ#����P A-O�i��?f刞����AOH�qxT#�̢�\�\o���������      �   L	  x��Y�vI]_Q@��~,��9�}`�j6�����e�#�x��sS�imklK*We<�ƍY��Ъ"�c���ZD�ՉV���C�↼�_/yq�9fZr�juƳդ�j2���3>+����:�"�+e�6U��ON�h����Vϲ664�/��ͥ����K��%���6_\,��0<�~>^�ry=_���|u9Ҭ��^u���/�L�3E;�t���؄Z���»&��Բ�������|V'=r��o?�^c�q5+�xq1��8i#��'�q����,�7����毻�%g}��E��9)/r�%d��u��ZV��f���%��w�g��	/�W�'�g���=��d�Ir!-q6�iʱ
��&g(j���'k+?I��H�BsI�RT"[�X"6�bH1�a����j����q��!�j1&�(S|��o1H%��J��r~����ʽ��;���g���U	M�K+�4>���eKK^�����r8پ���z=lv�_:������s���o9����dvzP�BѺVB&�@wiCS�2yJهn| ��g�i3�����l�z1��w<s��ߜ�:��[�øE�R\�$LE��#��&F_�$��e:Af�ï��-l�S}��{9���������!p얤S·&9��yh��r5��ϱ����d6�n9��g#5�p����z򝬑��/�O�t�2������g�r֋�o���dv�RFZiv3��o�tN�w���f�0- �]�(Ѳ�U)�V�u� ޤY�tX�Qr�,�_���2���ݏ�i��h5���܊m�A�G-��2�N�(?�I���c36��;�ڔ�Ww��n�r{������[,/�'����i�l�ms��L�������+�a+�ٽ��KƨD��T�#:����n�4c���,�ь�x1iw�_��6�	��׍�� �~'\�ro�Jw�H���E�V3�7`"G�b���.&��u�n�ل1ߠq���s�[%;o��j�T�$�"��|zI�X<Kk8+3���$��
j�$:� �	'�,�6�)�����rx��㫗��w�y� �G_�����6��OM@Y�2�)�HW��P���VHv��}��7�n�w�W_T�H�4�-�o|s�� ߪ2JZO�3�SUU�5��͌���l�[�h:��)*h�M�蛻Q����N��v�������|�/g|q �u��Δ�2Rϔ�g��r���Tڰe��m�o]�-��zk6�&b��+�d��I����yd�y�����Vaf1����c�Z�L�*֔��fR s��	t65
��δ�t���tC��r�Z=4$B;k�AA++R�)�ܢ6驕��g�	��Us���DH6�q�Ҭ~k��Y�.ؚ�D8U8g���`��2*?���|������t�srԊ!���
������<c���21�@K�UҐ%�[���w��G��gLV�BV���(�72�(���	�������P!A>p�6x�b_�� �w³�x����Lc���z����[�!DT�}皾��آ��Џf�[�.F	j�CQ����z�	ǎH|S��Ĵ���5��tN��Ʀ(��(a���7�G�4�F�H�;QucY�k.�h4�����������R�%�d8�o�A5�rb���DPKR�~�)C(O��ve�F��Y�O�ȣ��:_m�)d��ߞ#�X��*������j�Bk�	��ӊ)�^�D}��S W��X�P�3'�� �v$�e!<�)�.2���\ M���Ĕ�6�`Hz*vXQ��T\���)[eTtfʥ��$T�#���G�O>�v��6�U��C��Om�LpF���Gs�CU�~ka=y+��0���J3�	�6ѣ7E~B�߱fQ��C�}O|��̟C �c}j��M��z�T��mᐈ ��*��U�����>�J}��vF��RB5{C�s���~E�?���
_!�J5��=8^�� +k�?JX~'Ӯ��������|t����#����8"� �l�P���"E��&��'��ߩ�\1pm��s���ƁgA׸�Om~�Ġ
�K�b ��֠/��������af[{f*�ӊ����
#OE���Y'rV��k��q�"��\Dh�=#w���h�R�PT�cH���Cd��Y���I�A�W�����M�����@Cϻ��:D�!����6�(؇���ϵZ�v#T4��Y�K��q�R��'֥�)$*�A�[8U���T��r�*+׿���WOQ�Z�����%d;�&���6�Q��Q�_��Z���+Y�z��HP�Yh|��j�����k����f���
ђ���J��#in���u���x���� 7��      �     x����JAD�;_�?������(� �޼t҉Ȯ�����7/+x�SU�T(���iF+ b�<I��$�ſf�޾-��_}k�}�/��Ӥ($�99h�
��΁�;B�{�j��b
�(�$�ro�qc��O����q�_���.����kUh5*��)RCU�?:.o�Q�:��ɀ;T.�G�M��';��n��˸ڑH��W��B����qw��t��� ��d��-�.�F&���C���_)��0� }n�^      �   �   x����m�0D��](X2eQ���@@j����_� ������j4X�$@_�Kܨ�UMM�m��ߦ����kwu���q��qk�L�ԺZ)��Tr6J+�����C��?��/��{����l�v������l�>/DY}� ���S�X�s�E�MAT
���J0gΖ�H�le/����p M�%�%]`{e�P�S-y��d_�x�*%��t��QLo��r�<�<S��      �      x������ � �      x   '  x��WKo7>˿\�"����-
-�4� Ő6B���>A�{gweرly�*{�%��<�o�.N93Đ��b����Q�jgݬ��t�x{��z��������_mV�9�1�Ð�M�Z[�M�ތ��7�ں~7�j��Z��=wG���~m�j�J�����Fl��R`2)�T�8,�R�7�N�����x���w>B�y��ͲB�n6\�#�7�G�M~9���g��>}O��_}y��u�c� Y7����HAҕ
��-������+����=���e�\.@�*��*D���T�j�
������W�yFӧ�O�˦L�P���,�@-�0�֬ca]��b�f�������$'��۔^2%��Tf��GRS�/F��sk!9#ޒ�lTF��Xz�)�孃���[�g�o$W��	�-�T�@�Lr�T[v�����˨��*M��H$U�9X��URQ�b��P������}�y��	��~}S�FÍ�.�$dr�N�,yω���|�&�)V]XAu��t��`d`q��>�ԦD�?a~e���T���]���J�H1Uj���,'`|�$��*�PmM`�-��YhT��Ħ6���E�`h��\D"V"����H�]0l\pg���q��&��h���ATH+'%W��Bۧ����@��W��u����j[h�i{���^��=H\����%c�b�[-u�����E��f�]����v�~A�G}<���ة�"+AU^�hW���l\�ll��xr槇�DuA}�R�V;�`��b+hY�|X<8c�ּ�^S mL�T-:��4$t�-P<e�]+Λ�C�Aǅ�a_f@���+`L��'F�`���'r-�:z���t�;{S�2R�)`a��&HQ0��9
�U>מ.�`_*��6�+2��{r)K���o�#�!{�b;
�	��}vG�Jh��AnJiTdFQB뜜u��D*M��+eB�.�
{�O��\�
aL�s05NgԽT?$�d'.�/��Q�;^J�R$�n-W�[P�J�7���ƫG�ca��Ľ/���]]]����      �   �  x��W�n�F|�>%���>�y ���X�)���X��Ӕ�$��u���d5J�	�-	LP�tB��HN��47��<,s3RiG�s���t�v6e��C���Hg Fe��\T5���%S��+v����h������lb�:i%� ��A�dJI2d�y��.�,����j�6x0*"$���$:��d!1�I@��X] �@@�Z-Ii�>d�d��*)�dm@��s��!�չ(�t��`�X�L P	�������v 뤴�$�kBX�Pp�$��PF�&�uN�s;���>�8/#�*v���Ȏ����/m�|�ts���B���������u>7�2_US�e���0��ݍ���A1uT��&�/\W}O�_�y^�j�ڞ��_��9Oo4��4��y����CC?ٶLĒ�H��S�<.;��G�n����^u3���q�������O��m�Mn~=k���P1���!�G��pw�.宥~�d��ߖi4���뗻�G�]�mz��F���o7<���G̾V�3���סSۼ&?K_̙��js����k���G�K;�v��p��Zx�8�����V�~!COs{��ǘNi�at���V����hx��kE{�<Q�^+^�,��@��Ϙ�ɐ&-m���^��`!4�(V �b^�JCB�V�T�>�B� ц�hx�R�����dD��E2�Tp~������.�FA1%��'�m� O c
�.u�+8g��L H�VG�To�e�l*��Bd#kZc=�)��ǣq��.�ϙA�W��#}�ص�O�Kᝈ����=gw���;�y~�~}zꆌݕ����N��@��Z�u������+��\�\��*Ek�[~;k��9�P��T�a�Q��y]�?��<h�ߛ���'�V#�      �      x������ � �      �      x������ � �      �      x������ � �      �   {  x����n[G���S�e�`�����H�"E� m�n
$�ӨU$CV�>~y;u9�UC���p�s>�¹ z��!v,@<2��}d��
.6c��k}C"z}��:R���U_!���!6P�����xy��gO�'��Ze7���j��t-�+�q:i�����/bəSfHU��*�-�$��Q�b�Y���zwZB�]�x>��L�w�����ܥ�sah�T.�FE�[\m7c�ҳ\�6��}��R��0���̮%/nhn��w�\�%���r(G��/j5� Vs���B)b���}{.	��:�C�K��A��])B&����$������L�G:ȁ��ֈ y���!7(TQ<�-�����J쏞�f;�`z�۽0���fڽ��)췿u�EyB�0�(I�Iv�
����@XUC,���������	�j���}���M�S2���P*h	bT�6�}��UM����R��W�_N��;oM0������~a0��;��J7����'��MPU$�sTK��w�ު��-�v��z�4v��n�Y��:t�k��o�x�~�6�(޸K)ƥƀ���@.�H��<{���De�98���<���g6vx�9�c,١I��۠1���Y�����A�|�1b� 磉�0f0My��'�)�b!bu��R'�z�����U ���,T��a�J2P��\v䨳�h��P�����! X����Ho'�	�=
�0�׈4k~�J��Q���
����)�?>�<�ֆy��0p�������g��P:�4N8��FdVl�z�Cw��-75��h���7;�0N����!Ϻ�U���6l�5t���B����9P��c�ht��#WhΕ��y~�Ň-=�|u�ӯ��|�(I%��٫i���K[I�{��/|��wN;��,�X�xF�K��9��-�ڢ8�?����=:5�"%B[��9.'�n�F�M�9��aN?�Шi���i�g;ycՒ�3�ʗ��s�Y�F�T�xңU�����S�6Q�h/����?���L�%�~
�Ղm�]5��*�CB�ހ��Bf������*�k$[\����πru�<�y��,lk���Ӣ��v>����D~���$���6H�6Q�����RN��3�"O���H����:�[      �   J  x����ncG���s�����L�M��LCr8��dX^ ��w�I`u��^� �~�!I�J��A%�	Xf�5f�6������4��#��t>=��t����E_�N��x|;�y<��U�\~����/�W����O��>����j�RJ�	�u��!C/TԬj݋n���v��ǟ�G��py].��2����r%�N2�	i�9���������<G��qNz�2���O����/�?x0��Rh0��D� N�Qô�uO����>��&k=���c���<4�'B�zO�HY���Zb<��/�I��a*QS�jX�n �3T�؈jВ�kx���������Qݐ��J��P�5?���j��}�ڞ�%��ۋ��m-'/��+eIӏ�y}Nj ;LK��,e����������Ej�!gS��S�½Y!λ� �.��$� -��>���> �,]��v��r#��x!��F��ȍ� W8Q(m�X���&\kf~}�b� s���j�]nF��`wyH�ޜ��g�On�~ՋlP���ջ��{�29��̘+xGh3��D��s�mpˀqgC��k�~q�T��
�� ��_���jl���Җ �05�L�nq���R&��4�h3����_b�5�ɱe�`5y}�T��v�q�k�m
�۲��N�{�n�����Ѝ#U�����\޷@,�wcF�}g�h��v�"+�ǁ�rX"|�(�dB���ת�E���>}^�
���[�w@n�K�-����zt���=RL�Y��-c�qW�ok4/�%%wvc�T`��5���ֵޑ[5�h���\�_(�"�yh�.O�v�u����I�ؑ�o��M��ZN0�o�!H
�=�n[b�ٓ�+����q\��,}��ͨ��&��Җ {�^fkL�:�_Y�76�U�yW3��Cٱ�;�����'%�:h�k�F4�rJ�a_�X"���6L0�m�,��̾]�4��8�Ov6�u����!��m�\�Qn.=�
	�|]��o��:`c?\aܵLeD)��b�QY#y/�	���6B��I��%�]}������ ߛ      �   ]  x���Kn�8@�q�6���'�D������������%K�.��Z�io�ޯI[��N)I5M�{&��sj��f�I{s�y��jZ�M������^�{�J/���|dձe�J��Yw8m���ݳ�f�q�i��=Y6O�Γ3m�yn�dYy�8�NѶ���N�}�;��1W�K�;.��,f��V�r��m3��r�]i7Ÿ��{�f1]:��c��ӶT����s�J��w�s=g��Mvr:K|�"����f����{y��h�X9��"�S���Ŗ6ZҚs�ӿV��,S,�PZMBR����2vy+Q������Z�*k1�l�UԂVQZ�爬�=Nͱ�ixLE�"��hiɩ&+�gj��UԂVQZe-f��=��Z�*jA���U���-I�we�/���q�I�ZE-h��UԂVY�YesϬ���Z�*<Gd52��\���F}�J/3)1�y��~��Z�*jA�������YE-h��Ux�l��׬V]J.��<�qw�]׽���|�~���~���~���~��~�=ܯ�ݯ�ݯ�sDVuX�cۻ�:��p�i7�u��d�ZE-h��UԂVY�YesϬ���Z�����*��)�lӞ�����(����=zyY�<�3Ď.����ǘo�j�8d���G��n��^WI[[����E[���HH[���kZ�]<�챽��[@��w���N\C���Utݥn+ܻ�C[�4�s���o�J�c�2z���n+;���c4�W�w=�K��7U�mˉ����_\4�_�>DS���ތ��h��Z���S��<L�m�$z�K6+��{a�us"�_���X�\���{�M��Z�*jA������Z�*jA�l��rm��K|�F+i|���`]��{c�L}��Z�jA_�}��Z�[G�>�k���V!v��DwI�}V�}v싴�/Ң�H��"-ꋴ�/Ң��:2_�Z����c@���Un
I5�(#���_�}��Z�jA_�}�����:��c&c�:���:�\M34����EZ�iQ_�E}��EZ�ZG�k�{��/��{V���G�v����;}T���/Ԃ�P�B-���/Ԃ��:2_���ۓx��b/W�앪�RZ,��w��4��ӫ�����ָu֗z�;�j1����Z:��m���+��7�]ik��v��-Z7w�3��������hJַĹ��Sf��'���~s���-3�s"�n��Ť��gb|?O�Tڊ�M���v`����eA�򺅂n����Կ�+9Vo�|�<���o.-;+6q�H5Nj���^Ů����{�5~cӖǭa^rv�ߵ��Jq���w��݃���(⚋E�U,�0�O����1��Z�*jA�l\�*jA������L0����~o|����Tī��4yzZ����J����Z�*��Z�*jA���2�*jA�=Ŧ4i��4�?�X-������*jA����q1������Z�*3����ZN{�Ǡ�Jߟu��|}�*����Z�*jA�l\�*jA������L0������|�}O_��)�0�ME
�{�%a�������Ŭ���Z�*jA����Z�j�f}�T�����%f�hY{��.j��UԂVٸ�UԂVQZE-h��`VQZ����������Q      �   �   x����1�Q.�#G.�$�a��rʩ�T#��r �;[a�S��l��߹8Tkc�K8�E�˸�9#:��YN�f����7k�G��䛸�� �Մ����Ky�%~�_��m�I���W��)�\����������}(�;�s����JY9�      y      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      z      x������ � �      �      x������ � �      �   �  x��X�rG}���?Ъ�����$H(o����
�r$���^��V�¢���mK�}��>紬��{�P[��iP�4ߚi�D�e�ry�ZK;�u�Z�&Mz��Z���T�� ��&-L�[x�1Y,�L��-��n�����j��\���f�Z/i=[\M���Nm޼�y�|��n��jqu{��Y����bn@91��/2[c�I��L-�V����}3[J�[�Z���C��[�!Dr!t��� rd뢵=����|~�/����lEu~�2W�̓զ׃CvM?����!ٜ;��+��3��|pu�tv9[�-�%��
�?[cf��BJ��a��rFC���b>_����|�X/x1?F�ײ<y{-w�Fں��.�r���
����-ǖv�Bq�M���j+��O�o�n��Ȃ���Z.�紖�+XHL�:��r�P\��&C˩قQ\M?�M߬ߪ�����Y*��V���	
V�3ĞQ�љ�3������~5A�]�� {��N6s�����\�r0�[��ɨB}XM�[���&˻9|�Ǚ��)�N��0&�����H�T���+��|�f����J��	޵�|2Xu��5<EK���tt�{6��-w1!���
mب�2���Vz5����ձɎM�'W��+���U�C%E�֊4����o�P�w��WW4;P񣚧��*��1u�S��n�,�i�lI����CS�f	ئ�ݑU��9389�ZgWU��!��H*�jo�s����+(�{���M��b*��&�Y�K�JUAQ%'�sP���Yڎ37΂:\X�"*+`q�uAմ�4y���,�ɪ�LQ�,z�TtQr6B����S){k���D[�87_;�5Z�aأjŦ�)�X'*���3����wc���Ҁ��X�t��S7�<ڀ�|3x9��E�VZ2p�IE��� Ĭ��%�/{t�I��)4ot��j�N]ЅM�`[օӹ\�d�`y�p����/*IX�r|P�����l��o\�㋗O^���������>��P�.�Z�b8'����)����/�t���X�`��VE���7E�K�J��a1�[��Ԏ�����\=�]R�k��쁊*�I9KE��6�)lR1�>���+�6A��n��_���6ނ�T������xe��\�Q����c�ωH�`��Jct���0 �2^��ad���G}b<���\��D-V5| `�jk7��|P��x�g�s�\�T��u�Y�D�3�<�n�3��5v�����n4�a�l�����Ë�+}~�}��;�@�Ʈ�P�҆R��
���J���=���89v}�W�䬏�dk&U���X��{�k��l���(0�l��w�k������C��-�G�N�G�{U_\�>��	l"������M��k���D�n�F�q_O������3Z      �      x�ռ[ת��6z=�_��ǐ���$���"Hۭ�N����aT�oլ�Us��u��j��&=�����I,����� )��yJP�N��(
�����1��4Nx����T
���1���e=f)�t�P'uIU�i���&��E�P�3�@5��ƢϨ�������r�J��8e��%�A� �C�ܗɑ�ʒz�*�����9�*�<�=�E
eO!D2.���K��㪤^=��=�x��)�s.i"�:�D1T脍��A�e�_$��4+)<]����	^�1�3��E��XL����'Y��<͙������Y>�,�R9����S�SlB'B��Ǌ_k�?kBH�*0�@��DiL�8E��,�`�u�i�e}�ϹE�i��d0��HH`��g��Z����cW�U������ /2&I�� )�K CQr�U΢o<�9�M��8
�є� ���?q�"'ƿ�N�Y�_�@�I�L:t��{P³�@!@��q��I.R�����C�7�%n@₊S���)I
X�R6MA�$e�=��D}���ۯ��0������r)	-QH*�� �����V�����+�eW��E�$�Ӿ�e�?�M#��˨\ d�(Y����(0%*��<�&� gSbh.2�d�0���sA�X�y��Ѣ(�G�H�9-R��8�0�0�18�1���E��P�Iɏb!�bAJ�!�1HaLR|�?ԯ��1 |4K�)���O��	@�S	h�
	Y�Y����}�$m!�P�ix.N �a��A �Y�� ���1���L�Cg)Nb����W��k$� P�VDg�A���HAbQDvA��˖�� $.ˉY/Xv"N$��,K!��HҒ���V�7���4����qB,�@�Y�d��9��N�3_��nS�'Y)&gI�f)��x�@gē.ϸ/��O���bL� Q;�Q���3D�8&�$�������0�"M!�+(�_��1���C��v��4CgL�L 2b1fɾ p���
d֔��K0�������w���2H�a�=���o��,�&f9��`
�عH2`LRN� ��ls��m�⍇l�M�l���)K�N�\M��Օ�[?�����̃\�me����k���#�u,����͵w2�չsa?ॺl;?Pʺ5����E���$N�)��S`-g��;K�?W�z^�Z4��@2�s���[��S���g����M��8�E�xى��fr�?�4�w�C���>�~���o���='u4�ъ��;�c���q�=iϐ��Nx����I�tѹ{񶅬��g��jL�ٜ�����_���oy��8{i���� ��&m��|O��\�'�eZ �z������\8�Q��T%W����Y�S��(z�eI|Ǳm�o��:��찒�p�G�j��y�'�s�
�j'�ox+)�������j�=��tpS�ɣco�@�%���Y�r8pX��Oz���ԝ����s��8u�MS),k���u�ZA�N^�ve_�R�s�/�`u��[���d�9[P��팬���&�vެW��R#�~ږ\t���d���js�h:�;ؕ=����^�)�po����>������%/K����I��F����u#nu;�Z'��yuyYxG�}�y�)׋&�C%���Ts~�g}Q��'�f:E3�}�?�7���3�����b���ʣΫ�]wl:u��]��U�st�*Q6���H3����/�;��:j��n��>Zq���
nu#0�1_����f&��jwi>�G����s_L�y�u����<�;w�����C2���i�ZN��s��ɬI��U�1L�^����B���XmQ�8�	\������2y��}�4^�v���̱0�N�_G߶\�-y��k�;�gF�么,O9�!{8�k�ޞr;L�> �Jf"���y|�?�`��s�t>X}�����K����*�Y��>��f��RǠ�n�Z�6��7��C�9�s�7sr�����ⳅ#�ixZc�B�{�兎*%�(��+��5w�^jt7�-��w1I�tl�:�;~?���Z��9��cR��vr����ͺ���[��`R[o�0��j���ݤM�~\1��҆�����4�W���E�s���C���g��i�*�S�����|e-t;7��H�~�^��V�����U�
�]i�t-�V)\���+u$պd����U���8ȗ2I:�K$�=��-���ۿ҉�E�T����޿�+=�#��D��0߹�!����y�g�r]s�����\���������;h1�ҿ>�z�7׽Ѝ�$�6Ϯ�T�?m��?��hǔ�M���N������]��Ne��s�70��B(�i��2��v���E^$d7Z�"��E��
����diY���ho�BG#�%��H��ٮ8��E=���J�p	��h�Ǿ��=ۣ�^g���������fs���׫V�Еc�͘U]���Kg��(-��~�rW��Z���$a���=���T�T�ߔ+n���.��I�h�2Ҝ"�ޜNC]���삢��B�m���#�e]��u#����^:[���h�c�R��@���E�����]T��ͪ��f�o�k�)47�u�>4	�����q��4�嚾�,���t{���c�Bz{�zg��R��4O]�ݮ���i��_�q6�I{��4AQ5�{=��q��l~{�f�=��9�1��d�{�6����ɞ���x*�\��M���������[���h�m��:2o��!�Ē]I%��%[V»�gK�����r��S��f��f\�Bw�Mf�!~���P�|��<|�Ǭݠ!4�#<A���yؿ��7J�SM�4�Z�.�8zm񊎔Vj��p�2<����u~�e���p�����������jVG�Gwm�w�qOd�����n�ݛ��]ȴ����^U#g�n�:[�웾X� ��&���x�k�l�)������&�h,Z�Ȉ�J���q�VU�^�M��=-�qn2�r�r3�4G�����t}8Om{����3�c�֢�i癤�+5�/�3D8���$bDPkJ`tF�yµҟD�`�]1L�hB�S�����qG�X�I�EhH�N����e�[��;J�^�ߙLd���(��1IJa1樄�%d5��,Ƙ ~�e^B 8�����b�y�np�Hh�w:K �J���8��	�LY�fi�	)����������ejȑ�I�E$T�
4���������ˆo�@~z(z8����j��f�?R�#�A��ϋ	c�-1�)�O�m|�x��%	���w#��6D�����8���<��$uAȈ�P�)1��$Yʰ gXF�99E��0�K�	��c �)��A!��Aa8'SB���BF�0i���oI���r
��7%d�!c)������j��cZ��O�A��0��)!�y,q����J8ă��)�$K9.e�I���8�c(�����zȗ�@T����&�%����M���Oq�k���iڭ�<��!}�#:��1�&�!ċ�v�9!�<�P����R��z�V����7�4L�?h�e������!��#�"�`h��$`����7�z4��"M'9�y
�x)2)q���K#�(��f���H��H$ӓ�!��o�|�M�x.������9�01zc��!d�o4�	�x22�0Jdh���q�,[�����	b�|����ĔȒ��4&���,�����N+B��E�D�2���2�%	�\�gb����р��4#/����*q"АS6�J}|NbG`�yD��،�r��Dhi���~_�h�� ���فMǊ��p�K�dՇu>�EwHe�����z��7h}:MzjM:h�k'��<���N.=(��A��ci�O�}?�:?y��KG/*�j4�ߦUn��e�����n�Ou{�o���8g������G�M �:�@�l3pfR:h]���|t�7>�'����	�wVL�ZG=s��9�>f,'P����&�
���s.����I�bO�&pqe �Ni�߯���ݨ(�m    �����Yn���r=!���6���Y�Wf�a~��� t�i:�����}���ڣ���&\�j]�y_|�Ɯ��>��8o.J����Es2�����=nA�W�LqU��><�ήL_7������=�HQ]|�X<��˛�s��
��L�S�/�!NQ`C�>��rz��QP�YL��=�=��ʴ��F�<_��-X���F8�l���Y>\��>���zt��|��{P.O�W&F�sj&ÊE�ұPR-��h_�ї'�v�+-ͻ�ɔ'��.���y����'Fp��/~������������«}���B�21q�V8��{��-�IV��#Vl�h0e52�Yp�w����ZM�s��#�����+�~��C"}���L��GX�8o�)ؙ��_�~�wZq)>�S3؄������Z����	�����d��lv��94�`D��_7�ء`u��񇋵���J��B�/ 2�r\	jF��n�F��GQ9��!kq8��r�Ax{��XQA��BW��Z.���J��sj�L�ǭ��PZw�2΋����N}@0_��PZ�o/�~�/Q�%��GV4��8N~�w|���Q��2��M՞�;�.k������C���T0�"�]���~��N/�5czt��:ٜj=?�����Uk���΋;@���pv���j�R��ms7�k5�,�0l&u��?���u+y����J/��y�F*.~�:��^f�/���U��I�7�6��Sw5:&�O�Z�(�[3�G��|�ΧFr����)aS��������R���~���{�&=tc���u�ͪ���|���nZ���S��
	��>^�5��h�0�q~�F��Q�i4UP6���/��Oe�m\ӎ�+#�m�&�C,S�޳_v_g�8��J�#�>$t9�s�f8��zڄ/��(�E�ώ�C�g���)�F���9��g5��o���������*֦�*�ߜ���%�k�u�I����$���L��ԏy,$� >�$��7E�I��!��(BL_T�Х�.�n����Jt�#!6VSg�t��AH���Ǔ{	Y���-�G��>�y���Z�>�|�՜�j۝?���>~:V)%8|��Me�b�֯��!���=�}Z�+g��8�+ݮB��r��ߍ��c���\���Q�|?��zaĞqC2ƃ/�s8���1�s�9��Cb��L�U3>��P�����h�-S����+8�rښ�ҫ�8=$�g������|�z� .cL�c��V�>;�8�����F3V�\��h�5w��g��V���!�۴ӭc�Y8$x�qXG���ׁ֖|u�>eY�=�3���P�+nV�ޯ��y�2K1�;Wg�><�'���3o��}~�^׶��ϡ$�s����̥{<�d%�7+n��������_��,j��֎n���d��2d��2N=���B|1V����}�2t��U� �Y:���:�9�Þ�/X?̺�LͲ�,���<�^�6w^i�I�����>�~D~�F\����z��۠���{wPj�"3����s�T�ڪ�j��{����M�3��,�{:�$���9��rk	��<%�� jD3<N�#��gcF�s���x��|�8@�1��9���D�,�A��!�X�i*%�E�Q��~���Y&�ń��,��n�l!L,Egy,&)��|�&���L���di�I�~.�	M%���3d)᷹�%����L�
��dn).:*P�&��e��/S����w��&9�2*C	\���,���C�$c�8&zg2;�ӐZ���K@�%�2�׺�D �G�͉pKE �%b�L"L
0Y�%"�u_���ʸ.53�F�����>Dc�<tNS� <��A�HAV ��p��
Cs4K���M���St�`$ H�<��a���J/}��J���Ip��V )�晍�*׬��K^<�K�{���s��_<��n*�<�G�+�9���<ՃgI��1,��)bt�,�(�`��d1���8F?'�k����]:	u'�CJ��by��h:a�4�I�.�1��c�p�R?&~��%��¼����,�0�0�.]B��e\��"1�a���R�x6��n$�r�]
"��P�9'��G[f`2�J��*��lc�h*�<��]4�s��fK]�}���683���0��s�#
L��㏦)�Ø9!���%?7Ϣ1�@��S*1�X��͎gR*,�"����_zI�HƅЍ	��d��)����	4x1�dq���I���\��I���56Ř���Or1�kr��0L2ȒG�����ID�H~�		ɂ8]��q�c�7%9Z@�Y8�X1G���3J$D��AlD�9)����AF+�\F&�� �):A)�i�a��'�^�L�o0�����0}o��H��o�Q���W�����������j�ӧ�A��������K���:�7�Q�T��}o����Ł�<Mu�s�˗�hc��� _���&b��aǈ����=���[_�\4<����t6�Ah˚ֆ�l�z��aN��1m��՛႓�I?���Uo�x[0�ɸa��Ղ����(��auG����k0�i�>KJ��MҼ���t�A�l��7[<®�VIc⧘��y�)C�XI([sh� ��!���ڞ��Ѫ�Ir�`(���,�+�]���ɮ�d��9=�⭾wp|�f?n�-<�w��3l�N�D�Q�qɄ�|q�ϻ�Mt��ihs�>�-�xXE�!V}�Ɔ~�@�B�]��ieUec������Ay��dE/�t'�"������X�♫�z�5���sx?�d��8��ڳ��S��Ǜ�ѽ����MH��N�J:7�yz���X�H�&��U�W��块�<j��|�]f��}�	sJ,��V]���~ݱ�:į�a�N��6����	��gF-���K�߼��w��
���>�9aR��#�כ�yf��Q+����K�<��l9�')�e��H@���	��8~.���	J4t|!r��М���8�}v&���u#�[�=�縻���J?Ѳ��eXJa��1�^�>*+7R�'
�X���}(�֎�������8�t~�q�	V�6��pڥ�c64Kh��	��[�sw���2�N�����N���(��9r/'��՜��^_��w�Ͱg����+k~�f��g� ⚍�{�ޕ��_�v���<��͊���L�Uvp���z�H��ݕ��jJwQ����Y��+]��H���V�V��n胃�Ma%.}X����fH�gg���V,�d������Wչh���G|��3734�>?��)-]a�~{jx޼��`��(����������Cz�I ���s_�Ώ2j[Ӹ�������[�R5��d?4:��`]�F��	,[�u8���������-\~���=�S��G3q�s����u�,���xF{V;f�f� ���J���ios|���9j��&��� �v������e�	ӉW�7�;���J�����|��Y���;������X������ث���_��V����h�3��<��3R��x���:i�Sx|���h7=���i��,�h���������i<��������[!���l�}��UI��t�S�d�z�7֖�E�Cf��8��ȭ�*?f$�܋j:�D�~�����Z�U)onJٳ+ ǃ�؝�ᄣ��������#�[�D�.��y�G�<W�t��7
��G��F�ɦX�X�_lz9V͝o/�L;n"i����, p����@Ϗ�����G��~ms�~�.�#;�ye�`pd��n�ܦ�=�1�?|Q�Z� �OY���Ӱ���t��\]��+��T㟉o��qԓi}�B��Ŭ�G��6ـ9�v��������7�k>���ۃ�I�b��QQ����Fϻl��|s�k!��B���ܝ|����O�I��߿aR뵦ۧcV|�ú�����]�,s���4�	�C?�<
�6�
�+V=�󐥏���zh�m�z|��-z��w�������<��-F��~7�v~�tySԢ�9g�����&���$��l��لKZtjץSk�    �ݦ.��3�������qt�����:w�dNO�X��eT��]#���[��{�W��j��uk[?=+��Ƥic�Q����n�*{1�?%!.h~r���K����H���g,���u��!Ӆ���<�G{�_��(��r� ��,a�1a�8��r�����N�_Db9��ˑl���-p7,�	�'��_v��7׺R��XX�,}-	��8%x����&���������2Gvt��q�u�娙��9H���0�29�D�QL��r�*�̏�5��r"C�,�.�e�+f��p1�a���W)�����8�TN'1l���K�ᯫ_���L �0Η���RK;��0���k������<a��/�a�r�a$)X���x��8�[s,E�����pF Qȿa� VX*�r5��>Mb��Jh�\B�Ǯ���'��s-����sT!O�$/&\��ۋ�B���la)�2�""��q�qͦ<���i�O.	1Γ����4�
	D���S1�$�_�.�df�?�
�B��K��t�b�d	����';�Y
KBX�ar�"1��b����eh��4��g&�e�(X�5�1@��X�b�|�%^�W��f҄aS*0��,(�$���p%��~���9�P�c��cq�O��˧�g<��y���-KR����ٹe�1���f�;����oy� ��o���F�^�c��d`��b����(a�8ቧ��c�5IL�&Dğ����c=��ql�������v�={���s��gO����ۖ���b`��l�g��oj�����|6nN�ɖ5]�}Mǝ�m|׏�g?�O*��h��>#�V�9H��n����X���B�?��[�:��״WW�	�{�+a�����Kx,c���A����՝��zg�i5*����m�k������ϴ���]��qs����]YG�`-����!z�Wk#o�w�WU�Rd��v�	d�������sQ~ӄ�T�J�m��U-[6_�cl���0��1&9a�����m�j'xq�~n�M9g�Ja��`��\٬����N��~}2����������:M�wz:yh�Lp�W�[�F���hSz�s��$Is��mrr�n?°�4j�t���?�,��Y;Hk�ot�Ce�_�F���]a�>&� w�d~���Bfm|�6�"N��)c�`���>�뻰9���p��n��\d^6v(B8����T��옄?W~�:�qgUc��e��E�L�x�ֽ���G��e��ӷuU�%�@���T��l��*��(�e{*h�؈�'�]��U��qt�&�K���vB�$a�g�Vsez�/������X����(�+ӭ���s5V��mq�����2�v������˴6V������i�~�}�T����=�3�,���r	�$��F8����H���O������U#x�
��s�ě�f�2|��z��(+�;�5�ꐵ��e�i��b_��hNN��ӕ������5֗�\){Y�s�½>�a>7��=)>n�'2��+�=�X�x�T��t�)R�k�y ,`�*?��J\:��:�J�^�5�+��$��ꢾZ\�U��*FC�,�}j���׽��>h��ä1,�((� t��baE�T|WOX��'�~�}�������QJ;����ag��Q{%Sa�-7�5{��o�7Y�v�|�>Sy0s�߯���t���Iר���;^�M'��[���~йG&:<�Ǫw�;��g��>L�{�;C�iA�L��=�Ϡ�զ��y���ʡ��[m���]Ѻ��N���FO�?+��G�mה d�-#Z��3Bē��i�2�>ڲ��eO�ǝ�ᬊ���us���|:k���}�@T��c�s������C�7����Î��K�O�0_@G"��[���1ٴ��<��o�i�������>��m\�.͢���u�"���7Zo�ɬD���`Sp�(���F�>�en^��bJ�^�>�6v���_� `�:�>��)	l ��jގ��4�u1�m���Ia�A�F�l�g��h+g����h���������$�?�Z��>wʫ�c,O��w��w����q:�k�S�fm{��+���Z��A%�n�y?�]���K�r�i k����*�o��l�c��o�>�z��U�}H�Kr��o����v*=M�i�>Yzd8�1�W���Qޥ����O��_9լ9�Q�y����~
��y���c���V���z���W�`Ÿ}Z7��*�����vӣ�w�]w��(�Q�5��9�t\�&�g00��'�}�g�l-!�i��iJ�>�[[��:�����x�\����Z<��E�����6ǧ{�H{����3_�0<7e+X��	7��+�k�����3����;/}�r���u�Ń�{���*N.��k�d�k���jR;����������gޘ�r�
�z���UQ'V�{���Hߧ�t����a3�R6����]KU��OG�ZukN��#��|���uc��(�of`��]j��^��K�E�| ���AY�31���0�ѭ���z�g����me���G�n�{�~���� zM�~��z����F2X�&��a�x?M��Qf�B�$ף_��?�l͏�"�3�qFѧ;����|LG`�1x{�g�7'�Lƫ��qt�%C�@�z� �b	U�㌠sǄ�"���@�"${V�	�'Ԓ�L�$9˲q��8���´�\XZN�3b�� "H	)$ ��N:f�	+ɔ4������&ԝg�ܔ��{ĥ����)��f��u���}ӟL��~�< �e�ZP	�z���#W��S�L����V��POݬ�$����8���1��}���4-Ă�h������� 0������r"��d��"�^L����c���z��H�rC �-w[x
f8)�	��<�9@�`yl��!��*c$&�A��6���yBacB�QBq�q�� �a��t�9��ńqF%1-����E�����	&��@%	Gd�K�������*@POT$���+���b���R���LX��$<a9戺6��X��������`y�e����*�B4�����Uk�˒V&��	��rܯ��,��X^�1�%��C2>�d1�2q�T)�]�)9��<�c�دUğ�jIJgB�S([Z]��(6#"�	ʉ.a����?ɁR�<`C����ƒ(_z�(Ċ��D-�~�SZ�>OS���$��<F�R�Eo�!�x��� ϳY�/=�ݖ��8&	"�i�2q"�[����R��K��j)w՜�է!��S�66���8=�n��m�V�	E>?��]�;�]w�3�º�ָKd����L��ʱ��p.Dy���ڒ��k�lG�H�/H�xu��������&�8v�H7+3��;�+O
�
��������d��k����=i���]�T�؞��{����T�0W o�f���{"�&��9J�A�q7�g����/f�6���y�[�!�	�i!㻫��y+��	����rv �\�^x��@'�j�Dm�	A��i�7m'��9�}�"��4p�xz2��D��`�O>�6�8��T�ٳ�W<f�'���+��QP�w�����G�#|�A�x���k�i�Qj+��O�]GwVo�I�#ཫ�7�m��iw2r�=�n��M]|xE�7�+(��y�r�Z?�O����V�5o@�4��SѨ����k�X�����G��w�7�NO��9���9��:��k���q�_Ck�2,V{Un�n޸���NW�pR�s=���=I&�t>��>/}_�oK����������t�����+�eˊݣ�Ԉ���/2B
�b�t���6�	����Θ�	��ӟ���)�m�;۾��o��z� �I(]-x�����<���o�c&5H��)'%}��nի�F�:ߚshة�&۝e��5<�r�6��;_7���=�������r*>��J}��l���g偐��J�#A�yMƢ�z�y�tԴ׾�Ľ�����b��Q����&hK]���;Rr�^���j����G6��N�"��H�H�s&>�"R*�7,j����Ω�呧���C�!����� d  �^%�ɞ����Z���B��ss���:<��=�sB��ߗ)�YH��@���E��p�'���n>U�6���W"H����U���ENU��|g�L+?]��[)�ޏ�$~<O�� *"';����]n��|<0x����K���}(?{]��²9͹d���ͱ�m8� �i�?�T��I�ԟ��b��3��W�zn����ܯ"���}���ո��m�.�W�c��֞J�N�af��U]�H^��w^j���V�n�P��͈.��j�$F'L��m���Yl�[���6��.%�qT^k��'���_�����2�M?�Y��τ��f��Nѐ}<�n+�/ޱ��߀�WG���w?P��q�Ӿ3�Vǎ�o�������$|����ϴ�O
�9�2���i����o��	����zl�Tfr�a��feR�� ������A��R��J/�y�n�~�d�����i�Aٌ�X�J�%j��F(�61�b�]�*��d��\��Om_��A����ĵ��gC:G�z���zy���;��X�N��~}�;{G�����P���=`wω;&��z��D���ƹ8Jq�ǖ���Ȝ���]���7zsT^�3`d�񫃮�1�ŀYw�n�Ќ#�W�9������V�^W�'���էJ��6�;(%ɾ��*&}�����@��5�ږm�b�p�A>����E^�ܰ�}�������(�O�܂�
�˫}~�~6@�v�9Zm�� ����I�O�䳦��kX���\�cSuM���S7��cf��������n/��b��ç9���%;ܹw؏Pqmy�H΁ ���nM�cQ~����-m���)\��<	}t��:��E�/NOۑ��G֓v���W-vV;����~��S���>�ޟ����{[�9Ù�хB�Jq~'��]>�3N�����QdF26�?��}`bx�-:yU�q��Scs\~��c#�Nѱ��nd�R4��"������Y^F��� p��0Bå|�ӻ���R�0������|B�2J B��q.M�7��	9�����U
q��X�	(�i�e���=�$�# �y���T��@��@2Y���g�BtJ\���ĜO1�)��:!��cEP9}�1��9�E��$�����u`F$:���P",]0�Zn��xay�'�`�3Kb!,���	�2%@L�hiI�~��{��PF���v�쿊K� &���<�<˥9"<D����E^\���r���ZUƈ�Z��r��a��8�P1A=y�ĘL��'�71tNT��P("���"Ȱ�%?7��E��L	�b�,���9ny�؁ȕ�X��a+����m�>=ʜW�:������?߿�?j�6      {     x���ɱ$)��U�0Bl����o�|T�:����_���ԫiI�!�����h��6����!{~�ձl�0k硙S'�P�:��v��[=��ƚTGh���mY�R8�b�v�|�Z��k��[$���'ܴ{�T�n�E�q����rK	z��[��8Z�Ѵ�/�Zei7X�����C��$O=q7_�;{��%�R�d�<�5�d�Jj1Y�Eʵ�j!�+�.)���j�����E�<t�M�b����A�O�XW����v'�v4Q�cA�4���m[�>�Ug�XF��V��Х����my��tth����ȸ�0J�@c��^%wg�W�8��P��v�F��p˘I�����e���5���0۩�3Ʈ�ӽ7��;��Eڳeu7�}o����;��~����񛩝��-��g�9w��觅32��U
�֘�O+[�Ӓ��Siʢ ��&�j���F��^��z�͗��X�r	=��'�����r��ff�6_ ��=!�3��"{�O�s��x$>�I{�s�슻|=��˓�|�sE�{yUG�����9@jn>ǇkW�7k�z��vz���|��fB0b�z��;�#�qHh(/� Y䶆xWI��i#}�b��:,��>�Rpz��E�Y�g?[Rc���P�'3l�eZ��_�n���I/)���YN{^�� �_$��k[5 OL��B�����te'#�	:�� S_�S}S��H^St���&(L?YFE�l���oyt_��wd�#X��Ӯ���Vb�C���B��"��h�1��t�������T��w�k�I� E�vh�E=�!�3�X�Pѥ��i�O
l���5o�4�2{*�2H�(������ܙ�����#�!}�<%���YR:թ�lM�I��* �!�XcI�ڌNny�r���\O��e��r,����:�Z�{���m��C��Zv5���9-9��
�禧XW��X� J��}�bCZ�	���~zc��Ť�\͒Wa�9D3��F����1��Z���*Y��(�N������ӛ=c85���lL~�p�w�|ؕg�,@����j��Fh��@����W������ow����U����0�#�
�̸�H�y�ԵK����Â(�N	L)��?|��Ę�r��RQuc�t��G����v�Hë՟}����jM���r�����,�7Q�(b��j�o3��g�'�'"Ka��g]3�3��%V�Q�ʆ9��	-�jA�D_�� q�H��ՊAP�W#�YE�/R?#ف*���>���	��Z99�4�d�
mM|h�t��:0~/fd8����[H?�:V���a��jM�3r�H�~rEr��ow��t��d��k^���-}(ֵ̣/ҽ�/X��~�c䩗��b\O;����S�
�/A(��~ʍ	����j�i�{T��}����2jC;���D�W�5g��B���ćXj朖}��Z�s�P����[�|#�sZ<���k5� �fމbep`�=��PƾH����"��5����������rv󅫷�������=�b%��㋔�:��P�xJlO	c�v:��P��؇�MMQ�%a.um}�X�6Aݧ��O���7����ZW�3�j��n��%�/�y�R%<}>����9_$������R���G�� }}���/R�oKN���'C�_eb"Kǚ�"�fXjPI�� ��c�B|��*pJ��������\|�l��/_���y���̰'��Ųۊ̀F��F;�:s�_��-�r�yMh֪��ʪ��%v���$Xp��x#�׻^�7g|,ĺ�.�8�
q�'��y�@_��!="��qe��jruڪ����:��r_d|�" 3c}�o��T{ZoO�c�	�5'p�f���.��i��g���aw�1� ������.���
���w�O����ݟ�Y��k���W� �v����)��te��^�U�����t������te}�=�e�3w��H�)���]�dS��
Őq�4Q����S&LX�l���c9��qs'����H_����V`1*��q e�Sx�o���u��|�7�I�3�����\I�� �#\�I/����:6�"�t�jҙ����\�@�/��h�����w,�x�<�>6o���߭z3��az�*,�j9������^�==�ײ7osq����#-�J ��\���h�hbضV�|gf[o�h�w8���j�睭[_��H��3���t'I(Ҵ�`��}�����OB�A�g־o"�G�b;�<Ճ`Zʻ0����=��d�� ]n�QwLz� �v\��sM(����n�g��Eܩ�;}�<����^���y4E������&�)�
����k����mތ�v�/R�و���\��,o�]�̨�H	�~�����5@���{Վn˾H�L��Ha��p��ϐD�K@�����n�[K~w��VA�.}��E�/����q� m��.�:w�xnX����[臑Q��F�ˉuw�.c��t�I(h��ƀ�ZK[֝]��=�L?�Ӑ���.H�Fh�A�"ŶNN� �^+d�5�ߦ%�z��ݭ��	h�wW��!{W�9��%<�sZ<���̬�$�2�Dv"1ǎ7�9��m�F�E�Q�!p(����ĺ���a{�~j��������wۍ{3��sZN)���Eһ�4(?��R�����Ej�ЕKÖw�5Y�;ݨ2`�"_`����5->�;�.�]�ؾ�	�͑q~������~���K\      |   �  x���?s�@�k�j�ŧ��q�"<n�t'�BHb<��9gR�M�4[���{�Ki�b�3D ƈ�#`,AB� "�0n=OZ%��y_����Kic��;p}.�T �
Z��}�����Q�N��w�Q޽�����1O����M�u��4�$�_¬
��O�o�b�t��GFEo�a��$?/ёO�m��X/�dG,;ݛ�WC޸�I�1t���+!���'��M���GP��6�����w�`u6t|�K$��U����4��-��֤�.�9��v����Hd��S#��E��JS�7��Y�h_C���!Fl� fYe)��)��?d5��3���8�~�X��r��Y�L/�*W�(8,������Av�J$�r�f�	���K��<7X4�Q�X�Ԛ�j�7���Ȭ�*0e>�Fd^_��N��k���nև      w      x��]�RI����~ K���8�����H9�D]m�q̌��OVK�Jꛀ٘�1a�Ruugfe��eeU�>�?G�ks��8�yp<>���L�����b�%,�������Uq2��F�G����s_���p����O����,"��h��7H�@�����ß�����P?Xo���٨V��@�#,b�9Nn�]�{�ܥO�U�����`6�^�Ώg���p��7��G��Y���t
=vkUޯ����l<͆ͭ&�C�qtp�Ӣ���?N�W}�~��X*�1e��?�fޒ�3�%�� ��������솃���H�VBh걳F˥��`���j��.ܙ=���+�>V���n:��Ҹ��u�k��X����=s
\ч�pת��VΧ�IG��f��;x��!��L��Y�a`x���`����t6)tl�,.ﯮWm;������J�OG�l�J
��AL1
BI��6��A�e���\�_W?�?%��F'÷o�~��gO�Y�L�v�s���q����/1�D'����\U�Mх�����D�SA�����^g�����3��&��x0>�8��7�tlv1���׵n��lT5�w��bJ�Bl���b��"���0�0A��k�T�4����i2�����o��'&u�!�G� ^�M?BTZ�	�
����� �
�:��O]']lx2z���/N`����f���4wq����&)B(W��|(c`&2�Җb.}��	�#���F�`�-|w���y"0�Fc�H��t�0�Q�$R�h%w�#j�2���ƛ
u��;_4KJ��=f
h^#&�+@0�c��-�f�yg������
Ω�����4�>N���zpx2j�l?ðZ�@�c&��`g4p^��'�Z�Oѻ�r�x�b;:8�}���f��v�����KS5w7�+$
gTWg�d���D���*@�q��Ʃ1��kx�a��8c��i� ��$]9�!=ڥ�.��/�rq�yqu���؍��u��;aVˈ�W(8f��6.)�(FI�N�i����M��';����!ѵ�EU��t����xt:���n[�z��_����������[����:}t��#� ]7J^�}$�T���D�f^�H@�R��ӛW"X,	��AV;Ŵ�yT��Q�jjn껫�'��yA���M�12��H(탅��1�C@��⦳�WB�m��u����ม����ϱR�G]��+��E9� �6��y�"B� �BHk\T��P������O)�=�.����RXm>#w�@�!3�dt�Z��D(b>Ck�ߏ3������n�)�,'�2��Nk����)Ժf��WmO�'�Q���	�19_^��A��p��'�B^��I�5|T�ihB����32��p���Ȃ��҈B6����4&�gÓ��z�o5��~l:��6����������q��)�1ѻ���psn��v��4=ҁc7YDr���2�� 
i�%&\�4)� ���!��˻O��>l�wp�~<�>�l��� �˴�l����}�W��t`0��e�]�/]�݆�/aٻ���wc�w��ri~Y��߾\��eӐ��ZU�@XRB��e	q �$��"Fo�VF`�4H�&Րi:>�`�'�����ǣ���>�����n�˱�B��dMCJc�$-��:X�F��F0�2��!��?�|O'��*���FZ$c�HG�}�o���S*8�ƌ�zV1�8� ��U�H���{�n�p�r~��;�m�/[����-��&Ӡn��d{��u��C`��wj�b�H��-��v�3W\-�<~?4wf��&�g�ѧ� �����p��;�s��l0��FG� b�s�s4W�ō�c�S]��bl�R&x���� v;$�����C}/�C��jt��X1�eAD�!���q
1�*ır. ��j����ڇ���ӿ��ӊbOFǛ��>-��Cp��x���QEj{Zc����Amw�q�G��OZ�A݋6.�6�}��Ԥ 9Q�Al�1�1o�愥��ֻ�j��t�&ӷ-�_���>dA<������������T���9V���Áh컓,+8��H��G���E�F��D�'eLك��h�u�8�����qībc�m���ʛ�:��쿼�F&�\%�B2�	��d�k���'E6
D��xϕQu��d��9�~�����p�j����e�9��v��m;��|v�5���G���>�!���}	}RQЌi:��~0�����a�z��#��jZ�V O/6�����٧�}}�tp|>�����G�e���Yjc���vu�۶f��gR���P�I����7�7�2E���0�"�`�r�]���|A��0�j�u��/�k�6��DFf��Ym�N�GQ�Kj�h�]�Zx&�k�`�$Ӻ�$��V��#�֌K����VC�)6!}���G�W�ң
��*hF����QJ���s�p�x7�I"-r�Q�e�ar&��BE�����[��[,���׫�k��{��@�1X�e��VD��\)EBf7K��`���p8LFg�(gS�������x��Im5���J��.}խ�V�,u�5,{�޾�� :���,�G��������f�Hi����X���r� �Bʵ�n�on˻�������/��������L�)�+c|�/�K�:�a�`*��&�rb]�bu�����e�����~���c�!�f�H�H��	�����6�(������T��w0'��8=8f�'_�j�~/$^�.@P,���f�H��Ô(R�x �:.U�b�6�m��\����ł�K�
��	�E$X��F�0�m"Z������e�aҋ��Z3%�r��WR��0�e�q�`@��(�c��� K�iLm���x���>�P�` 1����_�w_{r��Rà,[@,�9��G�	VzeB V�Se��*��!Y뢔�U�@����<�{�nvY�x9�N�k��s�q|�U� �b�f���E�B`�+!�(���h&;�����%��Ì&��˷e��J頥�"���3+���*y�!]
G�y�V�Z5p~Q���S��Z��vsԒS0��a��9߀ŬVx��AE=` ���c����{�ef�����A	�����r��,�Ȭg>�����0F�~4��o����=����u*�/��7�_� ��ؓȭfVy@C������N� yK�����/]0qc��_��sSwOK�m�V�;tٺ��,C���	�g{m��>���z��Yc�#MUi��E��y͘V���5S���P`���g�����uf��ڻ[|׽+�|r^߈�!�q�2�J� �x��KCJh��7�?�z��!\��̸�c������R�G(Q�`�'����_^iWn��Y���%ߵ�|#{�ᶶ�wI�V��<jk�f�"�h���d(�O&�<�:���V-����L�%E��Eܣ���*긓���eM1+��Z�i��br��N�����ce�l^kE8���N׊���ro	A�)e��#0������1m������%�:�!x�I�$ ��Ð�V�-��[뤨� j}���W������QDКJY�S�T(H'��`4ǐ7�X���m�l�!����G�\
�ϥ�U�#L
��]�4�+�$ps�1���Φ:A_���0��~��Y�x7:=��o�oS�}��jX�tٮ��������w~
~؛�;��� z-���<�be�:�<xh���P/%@+Jd\��,�Pi�ϐ D��p:���t�R���Bh�$�3����t����U��C���?�>�t���t�~z�a��D�?Of;k~�3��:�>j��f��<~K�2�R�������? ��+�����阶��60�N��Q{%JsuX���}�����)Q�,��~��ձ+�q~��{Ŷ6;�ty���+OtY���Dv�K������[��xa��x�*��0��[-�36��(F�5�Ƞ����]0;tj89�����}� �  ��Nf�$m�������Qs4�N>�	�?~b�O?��+2��c�a�t}���Kk&��QDF]�U�Y������@Wb��1�d�X^}{���g��i����o��b Os�7��Z\���c(����.(l��Zki�%���p�������NGD2�Ҷ���d4�[��*=o+nծ������U�f�-;�ѽ��ƴfl��j�E�+�拌�`'�`�D�("�X����(��G� i����&��n���P��W����rў�au� ��c��҅�)�0� P9D���N[�5@/^3��x>�zq0���ӷ.o������K����R2.0��S*��+��@c%|�(�i�!D�
���D.ߣ����^*�ӡ]"�N�H� n.��*�@c`�E+�"F��>���T*��6>�,�FX \�������y}�k"�t@p@"U7u�����Ng�̮�v��N�L��U�3r~�����ԄVԟ[���2�aq�4߻�R��c������Z�W��� ��!,�لDm��!GW&2O�Uʥ;]�~>��u��&)�И��~��_~ם\�f�x)4&DhV���Dd�51�A���qJL�g&��䐀�:�V����x�sT"HLG
��1���"�6
j0���* D*�M5e�q��Ӎ�V�G0�|h?H�m�d�~��xlBch�k�̵ҹ{���ݘ��( xM��}�N DHsXC1��G-�D��к66��/N~�8�g�.��B'�۴ڍ����&���kx2�P`���DJ6$(T�A��+3P��`A: �;��L'�Kk�w�PM©R,�d~��cˇ�9`ؕ"o[=Z5�㎈Bf0b���_ fRA]��b)��C$�Z���	Ev�v��.!Ɩ����]/��e��r�� ��U��*� 4q&��5�P���W$��]��{�V/0�k� b��̊�#O��A�Z�H�D`�a�RH`S�A�SM�����\�߼�օ��Bf�_j@�^8� �(����h�b����秳|�ͦ6�.=�ͦϹ�l8��se�)Y����2�ce̝��X��2#����h.����08O�kf$#�qT�]�kc���{v����ǆo�Ф��\����=?���4�a��a�*D7*DS�!dɌ9XƢ��J+�a��6�KbB����B���J�4
zO���u�ͯ�o�K��b��!�ī�1&D ��&�����hD��]W�RVtg��>	�ܧy+�V=[�2�W\��0����b̣K����b���gF���!�M� ��XPE ���P�P���[�����:�I]��5V�>�}�?����;}2y:YlVR�j&ޅWu6��X(�y���N{��b��5#��D��:�V�Ti�����������R���p:{V�L�C��w�X�����v�R�Qc�r��P���
)\Pi�#D��eN�h���M��*;ux31���#�E�Z#@c*;G�*#,1����JB��p�^a�V����������A+�Ge��F��u��A$톢��(H�H�o-:;�$��r���f��O��`�|
���?�.�
���ˌ�6������TobzM� k��J#c]��o��Iήｹ27`ث�/����)����S���<��amP����q�,Fm:��$� ����we�.@�?b�}�(~�|<��S.F������B�->��Ø� M��>:V����~E�֞T��b��6��
�FZ�$fJF�M�By-��T�S缫h����$�g�`]������P~f�����~@��������7ZE���V�$�����].�������׽҇^j.�_Z��o��0�
���7��
� �M+#�6$��ǣ��x���hlܤ
�������>���}� 4�S��.T�$�R���U K��G
8�fRJڴ����L����K�a�K��:[[���C��6���<Jaڰʒ����Y��qL������ʭ��iV���6��w��LT)�%<�@�OOkIӋ���EG�d��Z������À���V<�� �e,��R+	��t���]��knVOV.k��k*�^�B���9�/]�RY����ͭ�cRjM�g-K[�*4�p$��v�#��� ���!�)��֜w��MMY��z�%�ڽ���^Z��`�����,!�q$��I�c+�����0a(N�2T:��3�or�Rw�}<��Tw[��Y�E�B�4k��,R
`�Z�Su$�Ve�����H�=+ES�����n��ed�(-��?o��m��qnCd�麭!5ZJ�S	���؍�6���"s�ZiX@�:,��fmT�6���U�;��v�k�JY_���^�?7���8[;(�4u���L`�J����. �����ʉ�S:�5��;`�A3&�~�r�y���|M/���]��%�i�.���#b�좑D���/|��#�c�(sL�� C��	KhI씻�x���J�a�%tX�l���Ag�����!(j����ZL5���E_��_��B@�O�G凑�(�1.�
`x��8s�[����/�MJ��~U5(L8���$��!��E��ȥbiňi�轺6`2�i�߆e��Aд�w]r M�����9(##SH;"��j)N[.,�����sş�}�6v�v�L� 3Q*��\]���g�	4���8˗�A��I�� )c��`���i�#e6D�I�g0��L�W����}f�����Y+�ǅ��h$6:l0��#	ĸ�ئ�U��jUs���Y�1[�6��u[o�OV���|�Ln#«BM�E���
2�.�c)1�%[2� 1-� ���R(�#G��Ųͧ�b�h0L���Z��3|E\�a$�~7��N�7T�FFҀ� w�����q��q�*�3,��`�0;jt�<�F��ZvL���q�*}z���:5���$y�A�/�ݦT;0� �e�W(u>���h�� �Kk�J!$���܈�t��Hob�!
�H+5�&����>�/v�|[�~�,��A�Et�)�ihf��b��DqpsK�`!�+|�uE_�$l����6MhN�씿s�� I q%�1�%U%�X_��m�9}#kӑW\�*�x/(���_���\��t      v      x�3�L��".Cd�!����� �p�      t      x������ � �      �   �  x��Tͪ44]��.��M�fyQADwn�4}��|�����,�a8Is~�Sw����d��bT�I�m��|d,e�NrH+y�Ej�K�>��q?�;�D׊����K��is��3�,8��?����8N���,2�K;4畡�ڻ�J���6ݛP6�h�|��l��廽��B0H��	��S3C5=s��WF�ѳS�G��-�UW�)���S�̝f/��a����7gw��]�9$��4��_�Սn�]5D��^�#���I���*~�n����+oE�v��|dU�P���\���㯿�6,�
o ��=Md8��{�:��-,Tk(�cҾӉͥ�ȹ�Л-���0nfrEF�Wl�\����pD���	5�b'[V�������5�m45��ТH���u���yB{t���.��̈́�u|�B��	5P�޺@xgY�����5�<��n��J��%N�>rx���� Ţ�:�첒vl��*6҂ؗ���	mr��:�dpK�v�����xf����ϯ���뗯�>&�zAz�v�9F6�t���'�g�V�9.���ĕh�K,P�8F��kE����{��k������?k��T���!�+<�����i��V$��y�q�����8�����;߽q�v��y<_�{I����jӿ{����u�7Ϝ��=U2�m6�
��>�q�6»&��2�N���b��׊�-O�1=�N�0i�s�(x����+v���<kwI�]:gC������/�u��      }      x������ � �      ]      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      Y   �   x���1� ���������vv���b"��@���[�I��%�|p�+<s\��yA���CL>�`���t��S(�M�&�zV4j{BeI)��'sُr)�$c7�J
���ш̪F���";d]	>��@�$KL��d�p3r�x�o4db�      �      x������ � �      �      x������ � �      �   �   x���1kC1�g���"ے�=>(�R:�d�bIvm1����J������
�o%pjj (��"l�Y�]]��d�����{�������pu��Jߴ��P����d���?nח�R�"���"� 1�rd���1N���=��p#(�FΓ,E�*�����s�����=�>�,��
�dn      �   8  x���AK�@���ٰ;;����x��V�"HgvSkk�T�C�������{obdD��a+�I�+�Ԯf	�*i̬S����ђ�R tc���2�mR3̓�Ӑ�s�e�*X[�����%\Ǽ���RY���	���Z#���CȮn&�ك�\},�E�<{�y�N�i�7�sv���NgQ8�Ѓ�&4/��zإxX����e /n��b�u}�n��.��׶F[����(Y%$4�?f�ª�W�� J���n����Bw��]�6���2^�,�nFw�� �O�������H�yE���X�� ����㟊<Ͽ���      �   f  x���͎S1����%����J������Nҹ�%ե�?A���t����q�{�qJ�A<E@�ܕ
��r����e[�ۥ����m[c�my.[�Q[�kb���So���>>�w]���Ĕ+P��ՃQ$����W�^�����ɱi, �;�JE�BPsJ��W[�Ʊ���oO�m���e���E�~�I�F	�y�E@\�У$��\�
��v�ε"͕�B� ��\^fK�,X^�V����aZ�����!an-��QQu�U�_��!0trA"�.��lÛ��|/2��z���'�T*���L�&Z�I�����oWj��Yj�zD C�'�̌�9�v��x���v��̪(k      �   �  x���Ɋ1@���RFKi��@��$�ar�$ML�Ѷ���$�h���A�*���&(��%��`A��M�Ye�Y�����O�����J��:l
Ï4�H�鰭�)Gإ�N�y���j��:�OOuW����O���t^B��4T��FM��Y�Q�%�Y5��ww�w�}��<��y��˹�~��E�������S�kN�*��V����Eg��\�0X�сE�[��3��t�Mڮ_<Ό�̌����i�_������̉צFrHEH��]L�ь�k���KQ˶@�B�^�C�Pl�s#BfRP��BԖ��-�W	�+[ �u<�e$�PXw�1QW4G!k�*�8/HD-�(���%�O�94&��!��9Xņ㭎��� u��"nY�Ki]VP�Y@�
(G�'�T�7Wyon�=Q��	u���eNZ�މ�i; 6��x����:�UU��� 3'"������8��<��r      q      x������ � �      �      x������ � �      ~      x��\]o9r}���y�+���8H�� A,��Udq"�mMly�I0�=�$�#�%����x՗��]����*9ptq����I����̔W��WSW�E��pQ��$��4��i��3]�����7o�G\���:|����н����،�7��.J�CFt\�p�cp]}t��R�2��'��ʷ�����߮�� ++�A�]
`~z�k)�r��u�|Ϸ��~������|		����:���w*SUlZ��2���k��k˵&�Hk	-T��n��G�͵����I��c�}��Hu�̮��d	&�ë�4���iM:	��k��O����/{��G���$٥ح���}��zMMv`���?<��������#վ���\R�.Kn��)9��u��e|�0�,��-�J��\ ]"����ūP�>Hف��<B~?�,�X�RK� �p��H��	�J3���	�׷��������g����]Ş�V�Z0c����V��2��w�o���������ͻ��<y�GC��B�
��JO��L����}^�[~�?}N-�G�lz\7��y��e�Uhi�T�(}�C�y<�,t���n¨pcZ��F���n$���?�����/@#yƻ\nQ�Bw}iw+w4i,6�?����/>����_�qr\���|�jK�Y�}@�\,z�Ovc�>��݌լ
y��{�k���A�!=��}�*̇��a��R��W^5wϱ�ɥ��G}��'�~4�0B�M��1Y�`��h��)j͓�Ҋ{��}�����y�T�,'��T*9)A��2+��le�]����~ta� ��r�`�!f�<QA�{�����������ϟ�ߏ.�0s�`xi��{F�%�hwh?��B: �Vp���,Yx�]F���?�D�u�F����;�i��K���"����'�1�Pi	�7�v���2��G\OǗ�?cmq9|Lֆ�HC3��E��ů���\��ۇ?.����.%�p��������]r�=��1"���7��.�"Տ_��"�Hc0xܐHfN&%�9nЖ�e�;�@z���.�	!��l!r�8����9��wcϔ>�:�0��/��	]��ղ����5 U�)����=.l2��.�dTw\��#�	��@S�����t|�}oi6$V�-��mAq��E�V9�J�W��;���<�%.B����Lܢ�;|d��no�� j��~��Ol�Zϡ��w\�*$=�P;a����B���� c7�(��%c��(<�V,�U�&�T����d��f-��;�0�����3�$k�j<(U8"�[��ܛ��֡?���@�x��5��7�]w2ct����coI�����V�����������8YJz>D'#e�#� �J>�܀Z�����k�璌$���<+?�@�2���'�GE<��YPco'����{v�Ӄ�{�����?\<T@�>�"�9���
�Q�!���|�dv��P��ל�F�د����B�xa�%;�:<��*2C�aTn�v�(pP����4�����6v�KW��^���Wp/( eD�N��%k�˂<'�?��Զ\�Bܣ�m!A��z,�����\) ��C�2O.�ܣ�+��6�2�R��Zh�ܑ|1ƴ}��{��-N����Z �`t.��[{�=诪��/%���tx/X ���1d�ة6݃��
�Q�1hYfc��Ã��>�䙲T�{��ܣ��5��y�����B���,�;>E���u�
���ý~@�W�S&5�\��!�8���u�á�l����iv=�������]��{�ʕē�Cw'y=8P"��2/� �g��Ù�D�e���[��@r��2r��-���Á��o)��f��	�O�@�zY�����*�C��wUTZ�S�8��J��Zlvid��F�O?�����SZ�B��[���\�`t�Q)y}��A�}�|��������כw����������]�;>�[B���a:6ф�&�Y�E��ں��a#�{JOk��h�F�q�i4����v��C���R ��R]�������L��<`�TO"����AִQ(^2A�L>JBF��$k�"'��(���F1��:�����9+�Bh��kE�}׷���k
e2�w�J%�	�t�i)%ԶRغ�/�3�ʘ9���E����b�)O�bgw�Ōx��a�j�f*��2ٵ�G�ݓOi׳�����ة�K�uS��IH��S ���k�澬��A�H�)B��f���\�y�+��&������:ea�`�`��zD,���k+�y5r���=d/�3�f���4\[�M�,��娗Zc_����Un��4J`FȂ1��BMt˂�8 ˂̫r6S}��tj�V�0ju�'�iEfhkTשP�JC�>���Z=���]���xY3x�W��!k糹����C���)\��)\�{��]\��8V���)坻�eA�稾Y��9��b��)��F�����kgg�aO�Χ��4��s �9H^�Sc�_�)�Sy��!��-��d����2��xRe=���Sg�EPo���n5����Pu3hks�
����G��)��rհ���Ҏ�k���2�k�+�K{+��0�L����m�5��ԯ�;�4T�&2Tq�]���D��NN$iւw��!R(GWsM%\.�  �>q�*t�;�����Z#QU��]�o����;\���[;�����Е$��]	H�iZ��`q�bZ�V�Cw����Y9Ov2��LVz)��Z4S*�B�E;�ti�h���
C�AV��\��7aM;��|��d#7�o�z�.8ђ\�c� ���?��Mg����0�����4fj�:���o�jM:eyP�AЍP[�(��v��X)��v�Z������<�+��� t��$h،y(͵���5��TF�[���4����3�risir��?�������=�/0�����?���/8UPܲ�V� Ҁ���r�2l�rE̽�<��;��5���./F~A�Y��8�y�]!��� 	Ҷ:����(CI�O�M��Q؅p�����	���~y��Ҫ;�7���P[�8�u�Q�N��󣧥���Wt�> ��8Xu9��u�*��(�Q߁��=p�
JL%��ܓU0�n'_�фe���wvY�V�|˞�C�d���$W�)�����G���,5�i�J�*3H4#�&�*~�	�N.��G�7�H�;ҵzk����C�l��T��������S!��7[A�?��py���Ǝ����{�p�2G�����al�G �k��\x�߃����������L|���)��X�{���GU��Vt%�����:d��mF�$5幷��u��ӪKV!!�:�y�1gm��g����8�:]�ꄆ�A���m	X��-��8
>��+ WU���13"�r���:o���8
=�Am��w�C����|p#�i�OgS�k��z.]�7V�i�٩�:%7�R*�y��3�/��W�_�v5�agV����^�P��g?�P���QT�_l�7�j��}Ycj�j���@T��何.���Yz�.�rPS?phVcȾ������z9{7�D{�}:��0�/����Jp}�������ߓ&�4%���"�߀��E�[	`��p���o�/$;�T~[{W���(\Ծ AM��hPY����N$�����b����891Re2���#�wg7�� ���nO�Zo�}�Bdlp���yYgo�W�Î=�REྈ�v`���� 7�O�Uo�{��yF�s�cCTg�����9E�q��H]��:���g����Kgf��~4����e�cX��c��V�`}��#�E��
l3 �OI�b	-��N�����u�@�ykR^�N"�{V���	���s2c'5
S�Dn-�*�,u
��N��^s�-K}�����j����l�~��]S�R��{����� ��j@x�C�����dz�:9z�gA��#��z���f2�������#i)��&���_�wz��W���b_1�9�9��8���� �  ��r�Ě��0��d�k2pZ��C��:dj>�&_�?��_�!�bϖ�B����\�Es�7���35��f�}E���]���#�s�u�U�iD)��'y��2xS̫hL�����s-����.��[�4�=ԉ$��,ق��URG�W>��6�!����*#���ʚz����C��}?�}����ǜ�=W�}F�.��r�W�%v "쐕>���bq]�Ll�z��s O�%l �h�6�-�x4#� 1�Nb����;;�|��^Zl�`�Q@7�z��y��:� |� x�]V��,�%����]��I�U7�����A)���7��	����6�
+���ou+l@�qzYL������1�
����󥶣�M��=���=��x�ڄ�A4�ax�������hi����w��?��\      [   �   x����n�0��S�^��ڋ��{��*+��?�Է�b�-�>c�g\��,p��A�'�'�/(���C���W�� �9޾��{�GK���U��ܫa>�/��<+6V�<��=2�H0Xh�6~,Ss&B�~��6��.0G_ ���^Q�ڥ�߇�`ى�բ�8Us�/qi�����>%�-����jԊB��p{tzŬ���P��C�4]���r��LI��&��wHL�)P'���J4�1���gY��#�V      �   #   x�K/�O6�42�BNCsCCss3�=... e��      h      x������ � �      �      x������ � �      �      x������ � �      W   �   x���͊�0��7O�Hɟ5vW�F���\j��j$�*��Յ;�Ło��s�CRG]�ul�)��2�����_!h���čD��{�R[!�0�KWhW�i�s%��i��R�U�o��x	��#�ʏ"�J��3�U���5�j�����f&�8�,����w����|>�c���!a�.��,�x��Pkf����ffr��c'�X      o      x������ � �      m   �   x���A� D�p����EX�=��$U����ԍ�&���g&?o8�PV *�-�VƕT(� �B��qj�D��`h8��phw�8�{�ZJ�;�2�i^
;�J���� !�΅6��{��IM�+n�a�����J7�y���t��K��U�k2ucHcOF)� ƮQ!      j      x������ � �      a   M   x�3�,�C__N##]c]c+#+=sm.#��4<�͍MA���
!�bK3Kc��=... ɔ�      �      x������ � �      �   4  x�Ś[r7����W���@n�+�K^ �cxQP�'fV��<a��L�ez^�ؕd����ڵ�,���[
u��e��I#�h�.��n�Q�����t��<}^�7�������t3��(�vQx�ϟ��6Ns�$�j�5q��5w�{���?]��9�f({#��$H#g-�,-��'��������d�>����M����Q���S���B9!�2�$M]I=����1V(q�P5Rk%i}w2;/�O���������_�]����?�t��w���6uce)���FӵH��ki\�����S��>B�XcE�;���z��?~n�4����;�b���X��@Cv�2��Z��t��������cU��Lu�F4{�����������_�������o#���\+X�Ʋ����bV��V�t�t�u=~d���RS��\�Z�%)t)u�mC�^nf��a�[
��RJ}��45g\��Y��!�R*�Ǜ��#��^����[P�^/�í�jKVN�������*�A�!(��V�푝�'��y5|���]���Gf�Y�\�q��=
FJ7�
�|ӗ���9k��&$U��%X���Le_�������b����*�-e" e<����
)K��i=��Bgd�5�4�M��`�U"���O������[��Ɛ�4�AQ.�:�I�� �>=���~�� v_�����P�A�$����;��R�lM-��H��.'d�u�>+P��z��ٷ������ .��5hU\4�SSY�X��4��z����Ej�>fIϤ�?��H�R��Y�2���� kq�ޠ��f�́@h����p��z��۲��$J���!L-�Eh@�-k׎��f��/?Ʒo�}w�A ��5�c`�( &g�	�2���J-�	�e}�BӚR(�����\�^>����{�� ����Ԍ&���ob�;�`�I[��IFq�=�*x��4*悴��9�#�Ȁ�KqX���E{L(��.�
z��y��Ý�㏷��8^��F��¶�k̾�(D���ɻd��:��+���V�5����`(Zq�ysF�\���r(�o��+�^Jm�)P�qfo���#��8g7GҬ͈Eq<��� ;4�j�8.|��wH������������u�k�ϔR�l�G[���P�W��]ʵ��M3��
_j�q�>c̴&����Ƿk�E���kTE]�O��ؘ�j���G�ߊ��yтW��XSf-�}������r�PxеR��P2.6	9:�'y�>�za}�����������S���|��Ns�"�E� �ҫ�F����t�O��2�QBG�(�[����� ��d�i���n2J�����B2xߊ*��`OE:���b@;K��DWr�^��K�b�,�yV������.� �����$)^g���$e�Z�H8c/����M�������h�R�w��Js!,"ut-�u	���/�=p�$��d�g�k��z̯�'2hd�+gL�ˬ�����7�\Q�F���'͝���{֙�uf��
�?:�'s2P[��M� �}Qo�P��Q��V�?�î�3���Ajs����a��hv���&�%*��	�\J���K&��ZQ�S%���=�~�> ��h�����N�<��U��0��UP-Hh�HPx(h{��*�� �V/�+����H�B�W\�l9DT$.f#�i`��A�w;7(:FD���zqsF3����|1ʶz���&�hU�g9�D��hU�w ��q��-I^3���RE���� �րTc�1ѡ $�C��M� �8���1�'gf��@��@�T�/(I�&=��M��97z(�<�p��T����Z���}�'�f�b�T�
�G����>D7?c7ߐ2�L��m�T��16�w��u�(Ȃ��V�{���"�愆��C�%�!7�n���K�JTXa`���D� 
�*�����ci�A-Zqo�l�Z:G�p�̜�P�F{K k"o�@�^s �,�R;1�=���Lp>j�-,���49��#�N�d����UPB��Y��b(��'9����W�[ ���|4Q!	�ڙ�}]6�	�y~(���Pw�5�i��R��I3M��&���!��p�J������Vӹ�I<-)�����cf���ܐ)U�~�W���6|�)P�N��S��N�k�6�<��"pLhՠ%������bk��c�(c�H܌f�+� �ov��ڈ�[������tQLm���r�$�Vl~��i�k��}M,�@�?M�",�Ίvn�XJi�����8r�f�a��;p�5|(CP(i)���{i�P [|b	��iO[lG��*qf*� �{M[�yA�F2ԣ�	ghE=�bc�1�e�l_�� ����By�s��ʢ0v��������U�f�]��y��_@	j�޴3lYi1잚�F�$����v�8$�ǧ`p?�	|@>���Ρ`�t��}t�r�(��kC�&X��4A��޸�=��/�4�_�@mk�l�0�fv�~�������Tvvͤ��+�% ��3�:�>�hmL|�~�	�Y8z�෥�)��y(�a�;�p7���[Q}H�KǬF���=�%��(㜃� �HH�!���r�� 5�~H?pB$/	���W�$v�z��O��kZ�'Th�<N-Te�f8A��tr�䎕�=|�<�6c	"���5DN��C1�g�O�5�J�T͹��P-�g���
<͆vlY�C�hvK����������b�͔`�LlG^(�fHY�O-��a)ю� 5 o�m�}-pp�	��$^S2�C��rApR�U�|t/	="�w����i8��O>\p�0Q�N�zK�g���� �9XWSčB���9�N�AG�������@hؤ���Kio�ն'�����߁�� ���+�$�1\ˏ��r�����ɒ�?cR�;�['%;���&t��\vl3��kmp��$(.F��Y"@�di'��G'/��O�kN�=4�*�Q�qm��L	�"���{|qp�h��!���t�iG'�"��f| ���,=�͌���i�ݔc�i�,?����N�7^�
��
�f׉��]P�^� ݈۬�}�{
�E���-�
�%"_6���D��:�Y�}lMf�=y��B��'�P���=M���P��Ve�)�UF+��Q��(΀YX
��6Չ&Bi��D��ב����Q}IL�剟�����S���n��{F?��J��lά~�=������{DdBSHL�0�Jꗿ�!��Y���B�����Wg�h�	�_��P��,$Y�I������$T}}W���
����/X'�}p�{�=�!���GñY��]�3�I���	ѡ�p������a|_eG���s���.�����Z�I���+�W\|z���f��~�)��80�a�h��!�_Q��g�� �qݚ��8����4��M?zi�������>�u�W��;RF �nO]aQ�ig+��R�Za5fdj�L@�;�p�[iS��>���S��#�5�M����^���im!      �      x���Ko\�r�����"�2�~,�"H6�]�L�
 ��錤Z�	&A�{�Ȟ��i���Ö�w��H�����T�ҽK2]f�6&*"m��O��[����.��~�r=�ܞ���tz����\��|I���߮C�%���2��TJ{}��
�_�����W{���^��?��Ҿ<��?z�ݒ)"R�V���u��*|���}ze��a�_��|�ݜ�j���)]1�og����"hߤIԳdd�B�$Z/9��T�� �_�sm��d�%&&�=
�&�M&C�A��7Y��(H������E/VF���z�+�yccX���08�1��tz��a��C#����VUm��U�1
�l��z�.�fah{����ף�q�K���������{CC�����ʇ�BkTU�F�UJ�zjB�(jkVą�!��.�	�?�f�௧_���|���|�6i�s&�T#cJ��'v>F�D�~ah?�
�2QJ�%�m"�oD�V*M㳨R��>�����}��8�g���*������gSeo��Q�/^Y�0���Z��?�綑G+�V�����Syge[�y�r	�Bۂ��I!9��5e�j]���r*׷��T�E���#ߥ���7�q	"a(�����'��e�U�3���r�i�o�?ZGV�O罝rl琒Q�H�Yx2�Y�-KrY�{�����!��T�cm۸�qp`�;��ٷ!vl��B0�xJF�_��S�NS59��K��/L������vB�v������xgc��8;ݫ���d3X�Zmj�MI��a �F��\�M�U ~���.�W�CEx���ͨΟ��sLh翖�2�?U�f�*��˹�FE#T�Qph�;4�`c�۸��8l�rW��
�=���e}Quec��p������(��0�M*��jE#g9�65(J�0�S�V��\U�=���0�O��T	`�UU	`�~�M�}� ��������c�'C�C��@�HK*�\/���������a�GK���Ҹ�{#�dF�,���J켅��18o�d�dߺq�C~�_o����=��ߞ��_�O��c�/��kz|(�z�B_v���7�z��v,�}���;8�������Q����!z4�ݩ��7#���?K�y�����c���_ɶ^��ٗ�t���g�}{��2u���A���	a����{M�)����6s�aދ��&
YG����I:��5ߙ�&��#.E\�����!�B�I��ȨZ����-�(���d��I�r��������Kz|c�	Q�|S=åL���z~����������Ԟ���_.<�^���96\�1�RE%�PWp:�}��t�E�B�5D�K�/-=>�f�CA��̰���1���&$�Z��*���cQ�G�Y���>���h�B*�<��3)n�R����ВW�g>�8�j5�ۙQ���K;�`pT�Bௗ��ˇia��l�I���'S�O!Tʪ�C�ɏ�4qp��w�9]l��*(��(�#gxE��bA��b�e��o|\,3)39��$kd������Sh1��łS����.�X���Qe�o��M<�V��_�j��4�.I�xv�!]�Q�eO�7��ѵ��ȵ�گn�)��;K��V��Zl1$o;�mI�n)�V����W7,�p��(����<��їM-���]JG�GO�Q���q�莃�Qw�ʲU�8���Tؒ���I�^�R� ��9P^���W�g-zx|Y^�8�� ಼��u!��W�]���T��$c�3U�eH�ruޮ_֡q�~G~�{��|��C���]���F�Y��ߪ���$9��+�#���>ZG�����&M�"%y0T�B�*�!��2w�B�2.ۈ|�*��>����������7���F�Ţ���b"9+��B�^W��>m�����#+ߧ���9��21�.2y�5ϹU<D�p��#G�}|������'m���+u��7<4�a�*QS/>�U�	���f\�MS.
�rx�=b<IL(IX��G+n}��S)sR.�n֘e�+���q��.Wu�ޡ���&.I��hH�GWjv$����p�W9�O��q�G#����w�|h��I>�ցl���WbK�=)gkKE8�슀�iC?.�`h���:iTr]y��(+.r�|ˮV�c�}���x\��3G��w��oD���C��*b��i���ٴ٘X���U���V��+���� <�o���@���>r�y�R�1J�S��ho���tU4C�yK1.�X3��Q�W���;6uQMۚ��8k0�~bk��11g��1��4��oi�f�����Qxga�f�P��D�q�}Eg�R|�)�(W��I�+.�`b�ߣ���&'O�E�l!_��9F	ZRvIT��j��B���.�x������T�%!���QWMB��vo��@"�n7'��*����\���082�=�m�p�RK)�l]3ہ��l,�Ͷ�Hrt�	q�b��X�G�_��ظhgZΊ���2�Ք$o����r�:�}!n�{ �}mR�#'{7�U>����ݵ-��s5UeJ>$�.��]�J�r�p��&5Aܡ��&;~/B��)�fx#S�ż�Q���>�q��e>�떧��9D����y7��k/�����"p�7UM��_�� �&MK1kcD"�ӑ�@���(�����|u���Gk�Ǯ)�)���A��h�筻�gr1x2>��p����������8·���n�ӽ�N�Y�5-8
ϒ⌷�`4�������}<@��Q̀��W� ��Exg��,�(T^��s��9]h��?Z,v���H�}tt08rtw���u8�+Φ�Ʊki�m5_M�ZK�锊
��Ց�O"}\�1H��Q�p���(�&6��u����`���B9��0��e;*��+/�䣉apd�;�[�&�2i:�=�V9�+RP���
��P�h+C���~|�	�^f������s�*Rk�)��p����h2{!]�*4B���L`�7��(8
���x!����ie��ƙ��S9��
�Nڬ��ʯ�` |^ǥ̌�3ߡ��t�؉�[	ɥƩg
&�͟K�9�rk>����:p�GC������x�1iQg�^eq�6��9�����nB��\n�: �����o��Pp�F��|8��������և�H���;�$�r蝛�"�U��ǅ\��(GG�w(�?�G�I�C+Zk�NFխ�Q�(���~{�RTA�Zw |v��>�G6�K录pr:l���=���iD�T��rM�7-b^� |ڭ��������w�?F�Iy9F��,$�V�ygNI�d�����ށ���%.�x6����=�K�7)�T8���}��ӷ�1����Vm�4�/���ZW�tu6HI���;P൫��̷�l�-���]���wW�g�wW�g��fY�]�8V�pyw=�"��D���E �t�]'
�n7��Y)|��0�ga7.��>�R���\��8�,�-�xZ���R(&I���z
��v{^�S����{�08�|{?�&����d)e�u�s�9��Ǟ�8�'mP08��`x�m��@-S���Ϝ�X�ޤ��*�����Zq��j�P�Zn�B𤺖co%o-:y��/jפ���c	u�"[np�j+m08���گnpCO��BZ�X�<�GN��u�ɋZjU�q�7r`7��"�#zĤp���(�*i�Hִ�H
�.����mL��/�
⦕+��#z�r���d/*瘶2�!ӂ�X[")B��ה���/�O�����������>�n�&X�1n��Q�t����	'Cˤ��S���%�c��SQ�*�P�,	�5e<==?\Y�%K?V�ap�6�Tz�tR�=�P9��Aqr�]�1^RI���Dٜ�|� |Q]B�����.u��Xa�8V�`pTa�_�}�	�'��jr]$����m����w��8��������?������ i  �_�+��x1v1�0~(�|ή0ԦJH���<�ak9U~{Ƿ�V4S�Z���n@ ���q��(8� �+�����ʈ����]��c+���x��-���_�� !�f�O[��}|1�0~S�D�a��b׶�+m_��� �dp�1*UI����.�R�vkwJ�K��A�������,�8L08&X��� �xp�S��wO��T���V�F9�.|�Z���@�|p ���<Z�8�F�O�.��\A�Ņ���y6�����w&锉~1\������p�܌.�x�	GW��Ry7H89wAv����*��}{K�W��ަCZ�h�'����!8���Px�`c��ϟ?�?p��      i   �   x�%�K�0D���Tu��{t�M�� �jB=}QX���ɖϗ��֓R�s�(5ޮ���'�6�gLof�.�ѳ�u�;��p��������"j�������Νh�`'���q�g���9��lE��n�ad�M�W�am��h�.bL���։�01eG15Ҹ�"����YrI�         �  x���M�G�ϵ�EA�!��8N8���T%Ap��=���כd!Ƹ��?�[�������V�J���^������t������~+Qn��Ǜ�|��翿~����ϥJ�u�<^��m_f2W�d b�'W�ӯd1�����_��x���������*tڌS�,��g��!�3:�ϩ��i��e��`�T���J�:d�K�z��*��i(���}���a1��yz�A�
��IX��|4H�N�.�[P9�F�}�d��R�ڔ�+���L�5%�4����T���b}U���$����� \��R�Q�������~�1!<һ��}��?�?���?�|������h6յ�6�~�/�Avl�J!����4#*�n|��X���ppM
�e��|�c����d��F5��bI�5�aJ#v��`8���4j"9��A�������jŦ��"^�e;u�̠<vvg��,sN�<�Ǘh�F#�3r�ó�:�]��#�ֿ4�rXp6�9�����]YNT�{��/O1�߅���Ő���2�{I��D�	��U�݂&�ex�+=���R��%&��1���S(}�g̱���=U$6K��d�W�H��][_��t-H[�͕>�����#{#EK�Ϣ�ƛRFLT�s����>���qԩ'D��J��G�����,�%�z cf�5GKN�9H��F�Y�{�����ߵ�O&      �   +  x��V]o9}��
��>�@ Qڤ�h>Z�P��쮴����x�س�!AU��^�xf�P�!��=cߏ��8R�I�z� 	AR)3:S�,�$gt1�D*�|�&��u:j֛g�g��I�V�]��6��fa�M�c}�\��/�'�I����ԂEQ�p G��{2��P$�Q$�v�a�w�t?w��6fΏ5��kEko5���ym�Bm��/�r�/P���;�=/�����NI�8�����X��a�%��Q��{E��}���uL��dZM�6����B�FW2&L�`�fn���:8���#\C�����������T�����g
� �^M�г�5A��g�o3F��r�De��F��1]A������˧/'@�=�9���l�{��+��ܳ*E�[�-SxC(v�_`�( <�L���I.���.d:�d�G�/�+,(�d�F~11���ټF9�����ֹ˺�gs��B'D|\�_��^!�c��d�͐�1��K��I�������4�Qę��h�3�#Ϸ,��kasWiZJ��HN�gm�1^��<�ݾ߻`�����Tu�,�6�Wj���Orm侊��j�`�nm�C��S�,�L�V{��*MJ���MRc�˔��R�P�U���;��������zD`�Ֆ��X��|=J��Y�z�(gi�RP7�`s�.Tn;ϱ��g�TF��z�F@Ҏ��S�A�"�I��;!�\g3�;n!T���_��Q��� Ns �K<帋ê�dY���	FĈ��$�����Ty�V�,�X�e{]���sv��˭w�A ���`sXXU�S���'S�	P1�����(�&F2B'vZv� 'H� 4�/�����A�Mϻ����%ΕɵM�"s��!f<s����R9}_^�;|P����Ժb�
�e5, �ճ�Gm+q�\)|K�+�d�_�����e_P6"���	x*��lj�[�x��"������F����d�`o�U�Ц�[�;������V��r����zb��@&JF��?X�{���~T6CW������s���9xk�A�tH��Qrb�_r>��mr�uO�U7��b��r`;-��-sVY�6��f��g9�Mv��.s]�,��������앚.��
*�`t�s�[�T�/�	.e�qi��z��L��x�Ln�nn��98W��9Q�~�m�j�.#��ݝg������yRd-_��*9���y���^��e�n�2��5�{��>,�Vq��)#�	�Xh���щ�`#�71�&3JUn*�No�}�#����Ae>61&���>��Y9E�V�8�1I\���VՅ�k!f�#�Z]��}��t=	�      �      x������ � �      �      x������ � �      �   Q   x�KIM356K2�5�0��515N�M26��M544I5I3LIM1��J�/.���OO��K�r��Gqqqt
uw�A������ ��      �      x������ � �      �   S   x�+H,..�/J�,�1J�0%5���,�P����B���8U7���R7���$�$�0%5ń� �VgO2.�!�nA��>\1z\\\ zm%�      �      x������ � �      �      x������ � �      �   �  x�}��n�1E�3�R�|�������`��Ii�A���I��Ά>����b�5@u4�	���G-��v�c����������~��p�n����P��f��,P�#�4�S�4ߠ�n@��Ţ)-�m���G������g��Χc,�8��2�Bա�&��g*�^���z���F�0t8�� #�5oj�$>��vnĲ6Qd	�.t h��2�������vێ��ǻ��r�k�.8z*:!r�U�;�H���q��5��S�,�i�+ ��20�L��戗�����t�rU���� �h˙ClP;6q"˅ޞ@]�Т�n�:�&и8X�0��ܒ�����ȥ5�� �H��֓t'�%G�a��Wɯ���z]V��ު0[?�L��zҺ���|����.��R      u   �   x���=k�0��Y��KdY'�k� $)�ٺ��5Ȗ��Ϗ!�KZ�����9]Az�و#��x9��:j|O��]mǭڑ�c�G�a4�2�_�H8�b�`�5-�-HZVό��e���n�3F�ܛ���{��)�&����R�Z��Xz����O��逓��w�C�
ʋ"ra�	C܇�x����{J*�G(�|t��Q����I���\PS��D|�,ˮ���o      �      x������ � �      �   �  x��V�jcG}��
�@�����QxNl<����ꮞ<� ����u���"9A\A���zΩf��}"H94���!�Xzq.�:|9�89�}~����t�"�E�kz��,��&ݻ��l�N�eD�ؤѰ�s�Lj���"��Y?�̎�'Lm��Q��g�G���ӣ��G+����}q-���rC=wkc$�(��[׿bm�%�$���o�'��.��g�����/�ݮd:������7���Z�S�қ�`[�[v�<�<�������c�e���\����ș	I���m]��@�H�JM�pw2ld�}=/7m^�7m�Y,o���h��qz�d�+���W]Z3o��X5��Q!LOX��ګ�(ײ�y�uy{�����q����䚑��	
F���)�w�߮e5�^֢�ȕ�������+���eu֋4g�B�� %KhR���S��n����|[�����{�����w&/�E3�����I΍i$�T�*�8��/���༖��eN�ؽ{��|&)|:��0�
�M��Q 4')�����|pr�W�vUӌ
M�;d� ^L��~�*c���`bO5+31(����J%��#����P�+̏���B���g��X�:�Z2�������$��9���oSs+
�[.���Joo��U��,4��J��䕟*�Ka�x�:<��%���/����!yO�����^��'����\��Tz�����2�b�ѵ}|������է��[h��>�u$U��8�Z�I�=w�ao�&h]CoC7`F�����&U��161B.��Vm�`W:)�IC�kT��i;��W���oy�0Y����
*�8VLX��wο�-��H�ѷlD�E>Ao*b!S%�@�"��F�j3��k���%3�qBc2��^d��W��V���e��U�x���S�^�*���'v��b�MMU*�bb%�3���h��=��-b���d2�,\Y      ^   �  x���]o�4���_�{���ؽ���. UB+!7��d���$�n���ؙ��B���d��J�k��='É �
����.���p&�B[K�c�������i M�va\���$���4������"�P��d��{a�5/�F�o�D"�N��v�t� �t� �Fk��%a8'�~:����d_f2�c;�42�A��*M[�Ȍ��ش����6��)�6ӭ��]������0��L{������L�lp`F�v��S���+��+��jaW�5��'���m߇���4�w��>�#��\y�-A�J3�H�8	ꍄ��>����1P I��z�6������A��b����ʬ�)�n��G���O�fH7I����>�JaR�q��xE��߇���^���h�;8�!��v��X���78m��ȶB:��qV�x��+}����TǃR�T�8���~�c|*?aOҭ��>lfmL�u��7I��5m��d'9O�#Α)�!��Ζ�m�m#���YN�(��2d���#�v���K趒D1%U>�Hk����i�T|�Ͼ��gQ��,T�S�s*v��/�D'I��&Q
�*����9�����6m��p�s�B�2�rsàJ�������3�7s��%~��H��H�I
��@�p�s���4@��~|�i�&�F��T¹��B�Hd�ެ�����7�:�}!�š�1L��=7��B�RUvD�sDr o`�s�o�KlEc�_s��@N^����������)��0o���:\��kT�<a\�w��[p
\']����Tɉ�
�p�w��
�d%E>h8�[�=v�i����C	�����e������b�<�<�k�@�K��Z���ċ�j�:H�0�q��H�"��z���/5�ցn�6��
d8�8ÕI�#�;9NG:y� b�*�%��� �.`/�	��s	d��� [�EN��q2��N_eA�n �\~ّH������|�N����O" �P*�%ͯi�����_��9�7�-s.�~Ɋp�W<��_�ʽK(�1_�(�=�5��4�5�o[�|OT��1P-+uqB�=cͣ.�c�r�)�bu��6r��4<�]�c�'�]~�����vy&��Y�%����aS��{�ve�7b�=��Ҕ���T����� ��      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      _      x������ � �      `   �  x���]k�0���_��#��3W[;�(��m�Q
�u�ĉm�i����r܋QK#�$�����������"���ݻG����QL��p�Պ�g)��4���K_�����R���C)�K��n�6���A��@3*� `s �o����7���f}a�t��X����E�)�f�X�#Ϙ�6?��j8�6!�	C�:�o���$�]_�H�Z�4�<���Հ x�a��L�4	�g�`��P��Yd��GVw�CQU�]��듋c���ɨ��!�	�֞�{�|kMr��T�S���M��LYڴj �x��~�2i{mwur�%����M�@r��7r�!J�s�i����nM��DH��g���9�� TK��'s��=���N�5"4ށr@���(P-|�t��I����7wW"�m��&��m��{����㢈m� &�ϒ�yFh�+�}��<��/��L�)̙��i0E�()�$�le������I<�N�1T�	f$��-�<aҳ1mg�DDƯ/(�~������-��a��^��z�|�i�� ��0�yc/�?`�s	�A�����ܴ}�)�7#EG[�)�	Q½Hp�}��jw�2{�ۢqEQc$���ow��dt��7�r�Dx��³�@��'�9Bxr4v �T�]ћ�J̾n��(��
�Me�w
h$����=���̯��k~��_>�y�w��ݾ�����/�WV ܀�~��b��S�      Z   X   x�u�1�  ��}���Զ�~�(�$h���p�mP���L���-"��ފ��n%B�|��N�*��_�=�gZ�������o;      �      x������ � �      b   H   x�uʻ� �ڞ"}z��l���H< ����7)��.̥syvf��R9��x5�rh�C��ۙ�(W�      �   �   x�����0�u/��\��s	+ �y�a	�M�Fep�	�E�tm~\�3E���M ��⚹���?��}�VX��^�h����60��΄�`YFv�ɕ��q?��q�u]��/NJA��N!��H]�I���^Rؽ�=������'�zA�L�'���tӇ\m�a]�:=�OI��Q�)��R�����k�.�_@������c��qi      �      x������ � �      \   �   x�}��m1Eѵ���+����
\���#Qˈ�����4l��|6�����&�U{��7�Ei�d�r���raClJI)g��:��ճ%�e-��-c�;���
����k���F�8[aVXv	(�ڈ�q�c8�ʊc��]�t�.LK�vX�3�@\z��"�I��wA,��;��wC,"��ܽ3b��a��mo0�?!���z����_���	��      g   �   x�}һ�0�Z�"}����d�9BQm�BP�@݁����A@��0��/�K��)��8�(�4�0�\Th���R����S_V���;������3ke��3���e 5Zַ�K^�b[y���,���c��f�1��"f^V�j�T��<#cl�C���'হ7�:��西�q?��lD      s      x������ � �      k   �   x�m��
�0D���a$I�[�J�`VJA*D�)1�Ͽ�7���Y���oݾ��9?�\�|�-Qc��p45G&G��T�z���.�c.7�#�qM,�j�z3۪�]CSh�*��j�>���
,��Cw5.̈́1�$�3�      d   �   x�}�A�  ���
�Ͳt��/6C,�)m��7x��FÙ_y}g�& $�!w���d4CoD��+�"8K�[�jbo�cH!�$���*�qYb~��CF�J-�O9B�?Rl^9�wP�m[��I=����+��O�:2      X   �  x���ߋ�0ǟg��������}����.[�ۣG�^�kM���+ۿ�I\�=Z��|ct>�'���U/_�K_B}��]����qq7��"��;�> �%b�x�3�E��YHϺh����h� �q�aN�P:����<���0��ˬ�ܔd"�\�R�m���7}�g�'
����E::�w��]5�W���f���3�=5��ޕ�9�U�}�=דݙʬy�<&ysx���l�_p�ML$I$2�u�dj��E�3�T����`YH9�o�ʋ�8����֬$��"�4�x F��J�IIk$��/��D���4J����]٬$I2z����ez�Av��%4���\�36$��}_�U	�^I<Q0��@dp��ۏV���RP�T*J��L��8�?BA�+õYl<��<�b�܆l�T������rA҉�ᓭo]��J��,K�|JX�����I�������L�W�Ζ]e�n�߳������-"[B�|�e/�f��=���      �   j  x��R9��@�����p �N62�̀@vS�:�6�߻w���0�U��Xϑ�6�}k�5��9��\.Br%G��P��,�A��<ry�1cU!�ʟ ��:� 
�&�̲��m��:��̕?�ƷS��\b�� 0������~����E*�&���G���P�����9��[C��vP�2��,K	��b4��x(/���������o��'թ�&R@�πⱷdK���|!�@棎q?����REu����9(�4�Ԛ���3����{rA�(��<P	}��SK���h��U��m���M)�!sM}��@1
�m�U�ͱ/:���+�uޞ�n�aN�?����9A�121�d~�c� ��F      �      x������ � �      �      x������ � �      �   �   x�u�AK1�ϝ���iӦ�9 zQ��^�6�pvD����u!�C�������m*[� A`��D�&1�kq�+B��qb�z���Q�����״&���W(�2(")ul���i�6O���6mF�׺�f̱y�>��Rȁ&��;Jj��<������i���P����_��[~�rY��e�������q|���ݲ���ݎ�a~��U�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x����� �@/�|�/�,a�If�k�&�i$�
q���uW�>��T+���0���Z�m_gn�8uHzvrݛ��|&~;%����$�_ԝ|rRqa[�=>|?�l��u	!�ʊO1ھ��n=      �      x������ � �      �      x������ � �      n      x������ � �      f   "   x�3�4�4�2�4�Ɯ&�F\&��@2F��� 4�v      �      x������ � �      c   /   x�ȹ 0���&��|�d�9�� �K�(
G3�9+�ͩ��7��5�      r      x������ � �      e      x�3�4��4����� T�      �   �   x���1n1D�zu�hS$%R>K���x�lR�L0���H3e�	�	A|
4��m�3�����X�Ü* ���g��$y����z}<�?���qcDL�#���V��E�v�\V�ʧ@!k-�Oa���v�٦QU�����{�^���2���=���>@ڪЩ#D'kZ���K�^z[Z��܊�"t�jM�۶��KJ�Ӿdw     