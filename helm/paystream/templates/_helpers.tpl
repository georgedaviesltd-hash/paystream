{{- define "paystream.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}
