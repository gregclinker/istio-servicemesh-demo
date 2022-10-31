#
kubectl delete gateway --all
kubectl delete serviceentry --all
kubectl delete serviceaccounts --all
kubectl delete virtualservice --all
kubectl delete destinationrule --all
#
oc delete route --all
oc delete svc --all
oc delete deployments --all
oc delete pods --all
#
oc create -f deployment-a.yaml
oc create -f deployment-b.yaml
oc create -f deployment-c.yaml
oc create -f deployment-d.yaml
#
oc create -f ingress-gateway.yaml
oc create -f egress-gateway.yaml
#
export SOURCE_POD=$(kubectl get pod -l app=service-d -o jsonpath={.items..metadata.name})
