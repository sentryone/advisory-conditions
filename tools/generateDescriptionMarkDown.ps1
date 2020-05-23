#This is a helper script that can be run to generate AC pack Descriptions and write them to Markdown
#In order to run it locally you will need to install pandoc https://chocolatey.org/packages/pandoc
#It attempts to parse the condition files and convert them to JSON
#It then grabs properties including the description and writes those out to a markdown file
#Pandoc is used to parse the description from html into github flavored markdown

$markdownFileToUpdate = '.\Descriptions.md'

Get-ChildItem .\* -Recurse -Filter *.condition | 
Foreach-Object {
    Copy-Item -Path $_.FullName -Destination temp.json -Force
    $isJSON = Get-Content -Raw -Path temp.json | Test-Json
    if ($isJSON){
        $content = Get-Content -Raw -Path temp.json | ConvertFrom-Json
        $header = "### " + $content.Name
        $severity = "``" + $content.Severity + "``"
        $version = "``" +$content.VersionNumber + "``"
        $tags = "``" + $content.Tags + "``"
        $tags= $tags.Replace(",","`` | ``")
        Add-Content -Path $markdownFileToUpdate -Value $header -Force
        Add-Content -Path $markdownFileToUpdate -Value "Severity: $severity" -Force
        Add-Content -Path $markdownFileToUpdate -Value "Version: $version `n" -Force
        Add-Content -Path $markdownFileToUpdate -Value "Tags: $tags `n" -Force
        $content.Description | pandoc --from html-native_divs-native_spans --to gfm >> $markdownFileToUpdate
        Add-Content -Path $markdownFileToUpdate -Value "`n" -Force
    }
    else
    {
        Write-Host $_.FullName " Could not parse description invalid JSON"
        #looks like some of the .condition files have been imported with bad formatting
    }
}
#clean up extra line breaks
(Get-Content -Raw $markdownFileToUpdate).Replace("`r`n`r`n", "`r`n") | Set-Content $markdownFileToUpdate
