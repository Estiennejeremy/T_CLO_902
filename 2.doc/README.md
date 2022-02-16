## links
- https://phoenixnap.com/blog/helm-vs-terraform
- https://stackoverflow.com/questions/60242051/kubernetes-what-exactly-is-imperative-vs-declarative


## abc
- alias: to get faster, you need 'kx' aliases like first letter of the word
- certification: you can buy CKAD for this project
- certificate: you need a certificate as a proof of your identity. You can hash it with a key. You can build certificates manually or use letsencrypt.org (simple)
- cluster: you can use kubectl to manage your cluster
- clusterip: is a service ip that is assigned to a service(gp)
- declarative statement: desired statement ie: kubectl apply -f // or how
- deployment: is a container mostly
- helm chart: helm chart is a package manager, that uses go for handling custom stuff
- https: is a protocol that can be used to communicate in a rather secretive way, you need a certificate
- imperative statement: is wayyyyyy faster `kubectl run nginx  --generator=run-pod/v1 --image=nginx` and you can append config in a file to create the backbone of a declarative statement! (let's be lazy shall we)
- ingress controller: is a controller that handles the traffic, it is a best practice to use it as a public entry to an app
- key: can be used to hash secret or being a public key, to decrypt asymmetric secrets
- kubectl: the main commang to manage your cluster
- linting: is done automatically by kubectl, but usually it's good to run it manually
- loadbalancer: can expose a pod to the world using a port
- metallb: is a load balancer
- namespace: restricts the scope of a ressource. Usually netflix and amazon prime would be in separate namespaces
- orchestrator: k8s, k3s, minik8s, docker-swarm
- pod: is a container that is running in a kubernetes cluster. Usually a pod has 1 docker container. (but may have 2 in rare cases)
- operator: used to manage k8s resources, often remotely. Like juju or helm...
- secrets: are sensitive data that are not exposed to the world, but you need to get them as matrix, user A wants app X to be exposed on port 1 but user B wants app X to be exposed on port 2, so you need to get the secrets for both users(gp) 
- service: is exposing an app to the "world", usually using a port.
- terraform: IaC, IaaS tool that can be used to deploy k8s resources (simple)
- traefik: is an ingress controller that can be used to expose services to the world
- vault: is an Hashicorp tool that can be used to manage secrets (open source or managed cluster). Fancyfully can rotate secrets(think mission impossible's tape) and be reachable via an API.
- ztna: never trust anybody! Typically a BYOD device scheme.
