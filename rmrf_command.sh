#!/bin/bash

# "rm -rf" komutunu kontrol eder
check_rmrf_command() {
    read -p "Do you want to run 'rm -rf' command? Type 'yes' to proceed: " user_input
    if [ "$user_input" == "yes" ]; then
        rm -rf file_to_delete  # Silinecek dosya veya dizini belirtin
        echo "File deleted."
    else
        echo "Command cancelled."
    fi
}


main() {
    check_rmrf_command
}

main
