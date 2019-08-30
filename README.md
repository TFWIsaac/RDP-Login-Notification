# RDP-Login-Notification
Windows Server RDP Login Notification via Telegram

Mit Hilfe dieser Anleitung, könnt ihr euch mittels [Telegram](https://telegram.org) eine Benachrichtung schicken lassen, sobald sich eine Person erfolgreich auf eurem Windows Server einloggt. Dies funktioniert über die Windows Aufgabenplanung und ein kleines Powershell Script.

# Voraussetzungen
1. Den Telegram Messenger.
2. Einen Telegram Bot. [Mehr Informationen dazu](https://core.telegram.org/bots)
3. Admin Rechte auf dem Windows Server.

# Das Powershell Skript anlegen und konfigurieren
1. Ihr ladet euch die telegram-login-notification.ps1 herunter und speichert diese an einem sicheren Ort. 
2. In dem Skript die Variablen $botToken und $chatID mit eurem Werten anpassen.

# Aufgabe in der Windows-Aufgabenplanung erstellen
1. Als erstes öffnet ihr die Windows Aufgabenplanung. Dies macht ihr indem ihr im Startmenü "Aufgabenplanung" eingebt.
2. Sobald die Aufgabenplanung offen ist, klickt ihr links auf die Aufgabenplanungsbibliothek. Dort können Aufgaben schon vorhanden sein.
3. In der rechten Spalte unter Aktionen klickt ihr auf "Aufgabe erstellen..." um die Aufgabe zu erstellen. Wichtig: Nicht die "Einfach Aufgabe erstellen..." wählen.
4. In dem neu geöffneten Fenster, legt ihr erstmal einen Namen fest.
5. Unter "Sicherheitsoptionen" wählt ihr den Punkt "Unabhängig von der Benutzeranmeldung ausführen" aus.
6. Unter dem Dropdown Menü "Konfigurieren für" wählt ihr die Versionstechnisch Höchste Server Einstellung aus.
7. Als nächstes gehen wir auf den Tab "Trigger". Dort klicken wir auf den Button "Neu..." um einen neuen Trigger zu erstellen.
8. Unter "Aufgabe starten:" wählen wir "Bei einem Ereignis" aus.*
9. Unter Protokoll finden wir jetzt ein ganz langes Dropdown Menü. Wir wählen den Punkt "Microsoft-Windows-TerminalServices-RemoteConnectionManager/Admin" aus (solltet ihr die Liste nicht ganz sehen, wegen der Breite, ist es der erste Eintrag von beiden).
10. Quelle kann leer gelassen werden. Unter "Ereignis-ID" tragt ihr die 20521 ein. 
11. Das ganze könnt ihr dann mit OK bestätigen.
12. Nun gehen wir auf Aktionen, dort wählt ihr ebenfalls über den Button "Neu..." eine neue Aktion aus.
13. Unter "Aktion" lass ihr Programm starten ausgewählt. Unter "Programm/Skript" tragt ihr nur "powershell" ein.
14. Unter "Argumente hinzufügen (otional)" tragt ihr "-File pfad\zu\euerer\powershell\datei" ein. 
15. Das ganze nun wieder mit OK bestätigen.
16. Ihr geht zurück auf den Tab "Allgemein", dort geht ihr nun auf den Button "Benutzer oder Gruppe ändern..."
17. In dem Textfeld gebt ihr nun euren Accountnamen an, dann klickt ihr Rechts auf "Namen überprüfen".
18. Sollte das klappen, steht dort dann nun euer vollständigen Name im Format Domäne\User. Das bestätigen wir mit Okay.
19. Nun können wir die Aufgabe mit OK bestätigen, nun solltet ihr vom Server aufgefordert werden euer Passwort einzugeben. Dies macht ihr
20. Wir haben die Aufgabe erfolgreich erstellt. Nun bekommt ihr die Nachrichten per Telegram :)




* Dies ist nur eine Möglichkeit, wie es geht. Unter dieser Möglichkeit besteht im Nachhinein auch die Möglichkeit erfolglose Anmeldungen abzufangen
