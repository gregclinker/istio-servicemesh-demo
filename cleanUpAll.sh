kubectl delete gateway --all
kubectl delete serviceentry --all
kubectl delete virtualservice --all
kubectl delete destinationrule --all

oc delete route --all
oc delete svc --all
oc delete deployments --all
oc delete pods --all
oc delete is --all
