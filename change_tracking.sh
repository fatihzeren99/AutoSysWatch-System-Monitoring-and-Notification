#!/bin/bash

# Yapılan değişiklikleri log dosyasına kaydeder
log_changes() {
    changes=("$@")
    for change in "${changes[@]}"; do
        echo "$change" >> changes.log
    done
}

# Yeni kullanıcı oturum açtığında yapılan değişiklikleri kontrol eder
track_changes() {
    current_users=$(ls /home)
    previous_users=$(cat previous_users.txt)
    new_users=()
    
    for user in $current_users; do
        if [[ ! " ${previous_users[@]} " =~ " ${user} " ]]; then
            new_users+=("$user")
        fi
    done
    
    if [ ${#new_users[@]} -gt 0 ]; then
        changes=()
        for user in "${new_users[@]}"; do
            changes+=("New user logged in: $user")
        done
        log_changes "${changes[@]}"
        echo "$current_users" > previous_users.txt
    fi
}


main() {
    track_changes
}

main
