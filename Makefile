deploy: .terraform dist/hello-python.zip
	terraform plan -out=tfplan
	terraform apply tfplan
.PHONY: deploy

.terraform:
	terraform init

dist/hello-python.zip: index.py
	mkdir -p dist
	zip -9 $@ $<

pretty:
	dos2unix *.tf *.json
	terraform fmt -recursive
.PHONY: pretty

destroy: .terraform
	terraform plan -destroy -out=tfplan
	terraform apply tfplan
.PHONY: destroy

clean:
	rm -rf dist
.PHONY: clean

veryclean: clean destroy
	rm -f .terraform.lock.hcl
	rm -f tfplan
	rm -rf .terraform
	rm -f terraform.tfstate
	rm -f terraform.tfstate.backup
.PHONY: veryclean
