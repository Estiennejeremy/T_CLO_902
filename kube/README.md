## Kubecontrol Dashboard
doc https://rancher.com/docs/k3s/latest/en/installation/kube-dashboard/
### deploy
`kubectl create -f dashboard.yml`


### get bearer token secret 
`kubectl -n kubernetes-dashboard describe secret admin-user-token | grep '^token'`

### access dashboard
`kubectl proxy`
`http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/workloads?namespace=default`


### delete dashboard
```s
kubectl delete ns kubernetes-dashboard
kubectl delete clusterrolebinding kubernetes-dashboard
kubectl delete clusterrole kubernetes-dashboard
```

### debug access for user
```s
❯ kubectl auth can-i  --namespace=default --as admin-user  --list
Resources                                       Non-Resource URLs   Resource Names   Verbs
selfsubjectaccessreviews.authorization.k8s.io   []                  []               [create]
selfsubjectrulesreviews.authorization.k8s.io    []                  []               [create]
                                                [/api/*]            []               [get]
                                                [/api]              []               [get]
                                                [/apis/*]           []               [get]
                                                [/apis]             []               [get]
                                                [/healthz]          []               [get]
                                                [/healthz]          []               [get]
                                                [/livez]            []               [get]
                                                [/livez]            []               [get]
                                                [/openapi/*]        []               [get]
                                                [/openapi]          []               [get]
                                                [/readyz]           []               [get]
                                                [/readyz]           []               [get]
                                                [/version/]         []               [get]
                                                [/version/]         []               [get]
                                                [/version]          []               [get]
                                                [/version]          []

```

```s
kubectl create clusterrolebinding serviceaccounts-cluster-admin \
  --clusterrole=cluster-admin \
  --group=system:serviceaccounts
```
