package sqlBackups

import (
	"fmt"
	"log"
	"os/exec"

	"os"

	"github.com/spf13/cobra"

	"github.com/joho/godotenv"
)

var helloCmd = &cobra.Command{
	Use:   "postgres",
	Short: "use this option for taking backup of postgres database",
	Long:  `to use this option you need to mention .env file which contains all the postgres db related credentials`,

	Run: func(cmd *cobra.Command, args []string) {

		fmt.Println("Taking Postgre Backup ...")

		runoscommands()

	},
}

func init() {
	rootCmd.AddCommand(helloCmd)
}

func runoscommands() {

	err := godotenv.Load("./sqlBackups/postgres-backups-scripts/.env")
	if err != nil {
		log.Fatalf("Error loading environment variables file")
	}

	// env := os.Getenv("DB_ENV")
	hostname := os.Getenv("DB_HOSTNAME")
	username := os.Getenv("DB_USERNAME")
	dbpassword := os.Getenv("DB_PASSWORD")
	dbbackup := os.Getenv("DB_BACKUP")
	backupDir := os.Getenv("DB_BACKUP_DIR")

	os.Setenv("PGPASSWORD", dbpassword)
	fmt.Println("hostname = ", hostname)
	fmt.Println("username =", username)

	out, err := exec.Command("pg_dump", "-h", hostname, "-U", username, "-d", dbbackup, "-F", "c", "-f", backupDir).Output()

	if err != nil {
		fmt.Printf("%s", err)
	}

	output := string(out)
	fmt.Println(output)

}
