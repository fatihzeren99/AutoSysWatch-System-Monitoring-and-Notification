#!/bin/bash

# Kullanıcı oturum açma bilgilerini alır
get_logged_in_users() {
    who | awk '{print $1}'
}

# Sistem performansını kontrol eder
check_system_performance() {
    top -n 1
}

# E-posta gönderir
send_email() {
    subject="Nightly System Report"
    message=$(echo -e "Logged in users: $(get_logged_in_users)\n\nSystem Performance:\n$(check_system_performance)")
    recipient="recipient@example.com"  # Alıcı e-posta adresini ayarlayın
    sender="sender@example.com"  # Gönderen e-posta adresini ayarlayın
    
    echo -e "$message" | mail -s "$subject" -r "$sender" "$recipient"
}


main() {
    send_email
}

main

