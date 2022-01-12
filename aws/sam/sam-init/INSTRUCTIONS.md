```
$ sam init
$ cd sam-init
$ sam build
$ sam deploy --guided

### curl against AWS
$ curl https://<restapiid>.execute-api.us-east-1.amazonaws.com/Prod/hello/

### local
$ sam local start-api
$ curl http://127.0.0.1:3000/hello

### invoke lambda directly
$ sam local invoke "HelloWorldFunction" -e events/event.json

### debug
$ sam local invoke -d 9999 -e events/event.json HelloWorldFunction

### cleanup
$ aws cloudformation delete-stack --stack-name sam-app --region us-east-1
```

.vscode/launch.json

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to SAM CLI",
      "type": "node",
      "request": "attach",
      "address": "localhost",
      "port": 9999,
      "localRoot": "${workspaceRoot}/hello-world",
      "remoteRoot": "/var/task",
      "protocol": "inspector",
      "stopOnEntry": false
    }
  ]
}
```

### NPM init

```
$ npm init -y
```

package.json

```
"scripts": {
  "hello-world": "sam local invoke -d 9999 HelloWorldFunction -e "
},
```

then:

```
$ npm run hello-world -- events/event.json
```
