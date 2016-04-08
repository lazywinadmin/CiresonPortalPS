function Test-CiresonPortalConnection
{
PARAM()
    [pscustomobject][ordered]@{
        "Credential" = [bool](Get-Variable -name CiresonPortalCred -Scope Global -ErrorAction SilentlyContinue)
        "URL" = [bool](Get-Variable -name CiresonPortalURL -Scope Global -ErrorAction SilentlyContinue)
    }
}
