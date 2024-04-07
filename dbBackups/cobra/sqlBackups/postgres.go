package sqlBackups

import (
	"fmt"

	"os/exec"

	"github.com/spf13/cobra"
)

var helloCmd = &cobra.Command{
	Use:   "postgres",
	Short: "use this option for taking backup of postgres database",
	Long:  `to use this option you need to mention .env file which contains all the postgres db related credentials`,

	Run: func(cmd *cobra.Command, args []string) {
		add := addition(13, 13)
		fmt.Println("addition of 13 and 13 ", add)
		fmt.Println("Hello from my CLI app!")

		fmt.Println("we are running bash command")
		runoscommands()
	},
}

func init() {
	rootCmd.AddCommand(helloCmd)
}

func runoscommands() {
	out, err := exec.Command("ls /home/prashant/go-projects/./cmd/").Output()

	// fmt.Println("the output = ", out)

	if err != nil {
		fmt.Printf("%s", err)
	}

	output := string(out[:])
	fmt.Println(output)

}
