terraform {
  # Configuracion parcial: los valores llegan por -backend-config.
  backend "s3" {
    # Bloqueo por archivo en el propio bucket. Requiere Terraform 1.10 o superior.
    use_lockfile = true
    bucket = "inf384-tfstate-20213298"
    key    = "lab3/terraform.tfstate"
    region = "us-east-1"
  }
}
