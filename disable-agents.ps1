$token = "wjqtxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxtgiga"

$url="https://dev.azure.com/TestOrganization/_apis/distributedtask/pools/10/agents/9?api-version=5.0"

$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($token)"))

$JSON = @'
{
    "id":9,"enabled":false
}
'@

$response = Invoke-RestMethod -Uri $url -Headers @{Authorization = "Basic $token"} -Method Patch -ContentType application/json -Body $JSON
write-host $response | ConvertTo-Json -Depth 100