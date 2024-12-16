kubectl apply -f dp-db.yaml

sleep 5

kubectl apply -f dp-back.yaml

sleep 2

kubectl apply -f dp-front.yaml

sleep 3

kubectl exec -it $(kubectl get pods -l app=back -o jsonpath="{.items[0].metadata.name}") -- alembic init alembic

sleep 2

kubectl exec -it $(kubectl get pods -l app=back -o jsonpath="{.items[0].metadata.name}") -- alembic revision --autogenerate

sleep 2

kubectl exec -it $(kubectl get pods -l app=back -o jsonpath="{.items[0].metadata.name}") -- alembic upgrade head

sleep 2