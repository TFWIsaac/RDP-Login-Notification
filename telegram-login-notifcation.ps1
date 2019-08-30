[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$event = get-winevent -FilterHashtable @{Logname='Security';ID=4624}  -MaxEvents 1
$message = ""

$ip = $event.Properties[18].Value
$domain = $event.Properties[2].Value
$user = $event.Properties[5].Value
$datetime = $event.TimeCreated.ToString("dd.MMM.yyyy HH:mm:ss")
$message = "*RDP LOGIN* `nBenutzer: $domain\$user `nUhrzeit: $datetime `nIP: $ip"

$botToken = 'xxxxx'
$chatID = 'xxxxx'

$telegramURI = ("https://api.telegram.org/bot" + $botToken + "/sendMessage")
$telegramJson = ConvertTo-Json -Compress @{chat_id = $chatID; text=$message}
$telegramResponse = Invoke-RestMethod -Uri $telegramURI -Method Post -ContentType 'application/json;charset=utf-8' -Body $telegramJson
