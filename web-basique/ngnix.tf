resource google_compute_instance_template nginx-template {
    name = "nginx"
    machine_type = "e2-micro"
    description = "template pour crée des instaces de vm tournant ngnix"

    disk {
        source_image = data.google_compute_image.my_image.self_link
        auto_delete  = true
        boot         = true
    }

    network_interface {
        network = google_compute_network.vpc_network.id
        access_config {}
    }
}

data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = var.project_id
}