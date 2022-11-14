# Installing Tensorflow

See [official documentation](https://www.tensorflow.org/install/pip#install_cuda_with_apt) and follow along, or running the following scripts:

1. Install GPU driver

```bash
sudo ubuntu-drivers autoinstall
```

2. Reboot

```bash
sudo reboot
```

3. Install requirements and the package itself

```bash
bash install_requirements.sh
```

This script will create a new environment call `tf` and install TensorFlow into this environment. The Python version used here is 3.9.

### Notes

Some modification from the official documentation:

1. In step 3, when modifying the conda environment system path, it is possible that the system returns a "Permission denied" error.

Solution: create a `env_vars.sh` file that contains the following command:

```bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
```

And copy the file to the environment path:

```bash
sudo cp env_vars.sh $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
```

2. Suppress the "successful NUMA node read from SysFS had negative value (-1)" warning: 

Reference: [this thread on StackOverflow](https://stackoverflow.com/questions/44232898/memoryerror-in-tensorflow-and-successful-numa-node-read-from-sysfs-had-negativ)

- Find the PCI-ID (with domain) of your GPU. For example: `PCI-ID="0000.81:00.0"`
```bash
lspci -D | grep NVIDIA
```

- Open crontab for root by running:
```bash
sudo crontab -e
```

- Create a cronjob that run this command for every reboot (Add this command to the crontab text file)

```bash
@reboot (echo 0 | tee -a "/sys/bus/pci/devices/<PCI_ID>/numa_node")
```

