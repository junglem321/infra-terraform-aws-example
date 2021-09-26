data "template_file" "instance-init" {
  template = file(var.template_file_path)
  vars = {
    PORT        = var.app_port
    target_dns  = var.target_dns
    target_port = var.target_port
  }
}

data "template_cloudinit_config" "cloudinit-instance" {
  gzip          = false
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.instance-init.rendered
  }
}