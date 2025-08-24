rule find_urls {
    strings:
        $a = /https?:\/\/[\w\.-]+[\/\w\.-]*/
    condition:
        $a
}
