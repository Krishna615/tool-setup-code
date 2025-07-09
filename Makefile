infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-internal.krishnadevops.shop, setup-tool.yml -e ansible_user=ec2-ansible_user -e ansible_password=DevOps321 -e tool_name=$(tool_name)