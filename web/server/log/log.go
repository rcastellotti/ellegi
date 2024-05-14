package log

import (
	"bytes"
	"ellegi/reqid"
	"fmt"
	"time"

	"golang.org/x/net/context"
)

func Printf(c context.Context, msg string, args ...interface{}) {
	var line bytes.Buffer
	line.WriteString(time.Now().UTC().Format("[2006-01-02T15:04:05.999] "))

	if reqID, ok := reqid.FromContext(c); ok {
		fmt.Fprintf(&line, "[%s] ", reqID)
	}
	fmt.Fprintf(&line, msg, args...)
	fmt.Println(line.String())
}
