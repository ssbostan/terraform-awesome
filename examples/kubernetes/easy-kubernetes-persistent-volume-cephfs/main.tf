# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "ceph_fs_secret" {
  metadata {
    name      = "ceph-fs-key"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "ceph-fs"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  data = {
    key = "dewfcbyfg3627c8gfeuidbnwjs3e2r=="
  }
}

resource "kubernetes_persistent_volume" "ceph_fs" {
  metadata {
    name      = "ceph-fs"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "ceph-fs"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    capacity = {
      storage = "1Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    volume_mode        = "Filesystem"
    storage_class_name = "manual"
    persistent_volume_source {
      rbd {
        monitors  = ["rook-ceph-mon-a:6789", "rook-ceph-mon-b:6789", "rook-ceph-mon-c:6789"]
        path      = "/srv"
        user      = "admin"
        read_only = "false"
        secret_ref {
          name      = "ceph-fs-key"
          namespace = "default"
        }
      }
    }
  }
}
