rule find_explicit_urls {
    strings:
        $porn_urls  = /https?:\/\/[\w\.-]*porn[\w\.-]*[\/\w\.-]*/ nocase
        $onlyfans   = /https?:\/\/[\w\.-]*onlyfans[\w\.-]*[\/\w\.-]*/ nocase
        $sulasok    = /https?:\/\/[\w\.-]*sulasok[\w\.-]*[\/\w\.-]*/ nocase
    condition:
        any of them
}