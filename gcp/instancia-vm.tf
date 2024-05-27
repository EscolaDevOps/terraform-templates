module "minhavm" {
  source = "github.com/EscolaDevOps/terraform-modules//gcp/instancia-vm?ref=v0.0.1"

  projeto = "project-id"
  regiao = "us-east1"
  zona = "us-east1-b"

  nome_vm = "teste-modulo"
  tipo_vm = "e2-standard-2"
  imagem = "windows-server-2022-dc-v20240516"
  tamanho_disco_boot = 110
  tipo_disco_boot = "pd-ssd"
  #script_sysprep = "startup.ps1"

  rede = "default"
  subrede = "default"
  ip_publico = true

  disco_adicional = {
    "001" = {
      tamanho = 50,
      tipo = "pd-standard"
    },
    "002" = {
      tamanho = 100,
      tipo = "pd-standard"
    }
  }
}

output "ip_da_maquina" {
  value = module.minhavm.instancia_ip_privado
}

output "ip_publico" {
  value = module.minhavm.instancia_ip_publico
}

output "id_da_instancia" {
  value = module.minhavm.instancia_id
}

