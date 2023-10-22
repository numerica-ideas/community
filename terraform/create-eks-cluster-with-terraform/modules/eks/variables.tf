variable "cluster_name" {
  description = "A unique name for the EKS cluster."
}

variable "public_subnets" {
  description = "The IDs of the public subnets for the EKS cluster."
}

variable "security_group_ids" {
  description = "The IDs of the security groups associated with the EKS cluster."
}

variable "endpoint_public_access" {
  description = "Determines if the EKS control plane is publicly accessible."
}

variable "node_group_name" {
  description = "A unique name for the EKS node group."
}

variable "instance_types" {
  description = "The types of instances to use for the EKS node group."
}

variable "capacity_type" {
  description = "The capacity type for instances in the EKS node group."
}

variable "desired_size" {
  description = "The desired size of the EKS node group."
}

variable "max_size" {
  description = "The maximum size of the EKS node group."
}

variable "min_size" {
  description = "The minimum size of the EKS node group."
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "kube-proxy"
      version = "v1.28.1-eksbuild.1"
    },
    {
      name    = "vpc-cni"
      version = "v1.14.1-eksbuild.1"
    },
    {
      name    = "coredns"
      version = "v1.10.1-eksbuild.2"
    }
  ]
}
variable "eks_role" {
  description = ""
}

variable "node_role" {
  description = ""
}