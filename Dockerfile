FROM golang:1.12.5-alpine

RUN apk add --update --no-cache git make \
    && go get golang.org/x/tools/go/vcs
        
COPY . $GOPATH/src/github.com/cmartin-gf/goreportcard

WORKDIR $GOPATH/src/github.com/cmartin-gf/goreportcard

RUN ./scripts/make-install.sh

EXPOSE 8000

CMD ["make", "start"]
