{{- define "first_part" -}}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>{{ .Config.title }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Opengraph Facebook Meta Tags -->
    <meta property="og:title" content="{{ .Config.title }}">
    <meta property="og:type" content="{{or .Config.og_type "website" }}">
    {{- with .Config.og_description }}
    <meta property="og:description" content="{{.}}">
    {{- end}}
    {{- with .Config.og_site_name }}
    <meta property="og:site_name" content="{{.}}">
    {{- end}}
    {{- if .Config.og_url }}
    <meta property="og:url" content="{{ .Config.og_url }}">
    {{- else if .Config.latestVersion}}
    <meta property="og:url" content="{{.Config.latestVersion}}">
    {{- end}}
    {{- with .Config.og_image }}
    <meta property="og:image" content="{{.}}">
    {{- end}}

    <script src="https://www.w3.org/Tools/respec/respec-w3c" async="" class="remove"></script>
    <script class="remove">
        var respecConfig = {
            {{- with .Config.latestVersion }}
            latestVersion: "{{.}}",
            {{- end}}
            {{- with .Config.specStatus }}
            specStatus: "{{.}}",
            {{- end}}
            {{- with .Config.edDraftURI }}
            edDraftURI: "{{.}}",
            {{- end}}
            {{- with .Config.github }}
            github: "{{.}}",
            {{- end}}
            {{- with .Config.editors }}
            editors: [
            {{- range . }}
                {
                {{- range $index, $element := .}}
                    {{ $index }}: "{{ $element }}",
                {{- end}}
                },
            {{- end}}
            ],
            {{- end }}

            {{- with .Config.authors }}
            authors: [
            {{- range . }}
                {
                {{- range $index, $element := .}}
                    {{ $index }}: "{{ $element }}",
                {{- end}}
                },
            {{- end}}
            ],
            {{- end }}

            {{- with .Biblio }}
            localBiblio: {
            {{- range $refName, $refObject := . }}
                "{{$refName}}": {
                    {{- range $index, $element := $refObject}}
                        {{ $index }}: "{{ $element }}",
                    {{- end}}
                },
            {{- end}}
            },
            {{- end}}
        };
    </script>
    <link rel="stylesheet" href="./assets/templates/respec/additional.css">
</head>

<body>
    <p class="copyright">
    {{- with .Config.copyright }}
        {{ . }}
    {{- else}}
        Copyright © 2021 the document editors/authors. Text is available under the
        <a rel="license" href="https://creativecommons.org/licenses/by/4.0/legalcode">
        Creative Commons Attribution 4.0 International Public License</a>
    {{- end}}
    </p>
{{end}}
