package sqlBackups

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "cli application to take backup of postgres , oracle db , mysql",
	Short: "My CLI Application",
	Long:  `A cli application to take backup of postgres , oracle db , mysql and more things will added in future.`,
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	// Here you will define your flags and configuration settings.
}
