locals {
    namespaces = toset([
        "avikus-web",
        "avikus-database",
        "avikus-nas-core",
        "avikus-bas-core"
    ])

}

resource "kubernetes_secret" "ecr_secret" {
    for_each = local.namespaces
    metadata {
        name = "docker-cfg"
        namespace = each.key
    }

    type = "kubernetes.io/dockerconfigjson"

    data = {
        ".dockerconfigjson" = "${file("~/.docker/config.json")}"
    }
}
