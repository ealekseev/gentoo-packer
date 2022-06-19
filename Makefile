OUTPUT_DIR := output

.PHONY: default
default: raw

.PHONY: raw
raw:
	packer build -var-file=variables.json -var="output_directory=$(OUTPUT_DIR)" qemu.pkr.hcl

.PHONY: qcow2
qcow2:
	packer build -var-file=variables.json -var="image_format=qcow2" -var="output_directory=$(OUTPUT_DIR)" qemu.pkr.hcl

.PHONY: clean
clean:
	rm -rf $(OUTPUT_DIR)
