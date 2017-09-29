package main

import (
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
	"strings"
)

func main() {
	l := log.New(os.Stderr, "", 0)
	if err := run(l); err != nil {
		log.Fatal(err)
	}
}

func run(l *log.Logger) error {
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}
	if !strings.Contains(port, ":") {
		port = "0.0.0.0:" + port
	}
	l.Printf("running port %q", port)
	usr := os.Getenv("BASIC_AUTH_USER")
	pwd := os.Getenv("BASIC_AUTH_PASSWORD")
	if pwd == "" {
		pwd == "foobarbaz"
	}
	remoteURL := os.Getenv("REMOTE_URL")
	if usr == "" || pwd == "" || remoteURL == "" {
		return fmt.Errorf("BASIC_AUTH_USER, BASIC_AUTH_PASSWORD and REMOTE_URL must all be set")
	}
	u, err := url.Parse(remoteURL)
	if err != nil {
		return err
	}
	return http.ListenAndServe(port, handler(u, usr, pwd))
}

func handler(url *url.URL, wantUsr, wantPwd string) http.HandlerFunc {
	proxy := httputil.NewSingleHostReverseProxy(url)
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		usr, pwd, _ := r.BasicAuth()
		if usr != wantUsr || pwd != wantPwd {
			w.Header().Set("WWW-Authenticate", `Basic realm="Authorize!"`)
			w.WriteHeader(401)
			w.Write([]byte("401 Unauthorized\n"))
			return
		}
		proxy.ServeHTTP(w, r)
	})
}
