package templates

import (
	"html/template"
	"path/filepath"
)

func getFuncs() map[string]interface{} {
	return map[string]interface{}{
		"loop":      func(n int) []struct{} { return make([]struct{}, n) },
		"toLineNum": func(n int) int { return n + 1 },
	}
}

func LoadTemplates(base string, templates map[string]*template.Template) error {
	pattern := base + "/templates/common/*.html"
	common := template.New("").Funcs(getFuncs())
	common = template.Must(common.ParseGlob(pattern))

	pattern = base + "/templates/*.html"
	paths, err := filepath.Glob(pattern)
	if err != nil {
		return err
	}
	for _, path := range paths {
		t := template.Must(common.Clone())
		t = template.Must(t.ParseFiles(path))
		templates[filepath.Base(path)] = t
	}
	return nil
}
