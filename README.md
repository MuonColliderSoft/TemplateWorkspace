# Template Workspace

Template for developing custom key4hep packages for muon collider software. 
Fork this repository and rename to create your own project.

For a general introduction to the software environment, see the [muon collider gaudi tutorial](https://mcd-wiki.web.cern.ch/software/howto/gaudi/).

## Repository Structure
- `exts/` External packages not included with the key4hep framework.
- `packages/` All custom packages linked using git submodules.

## Setup Instructions

### Container
All commands are compatible and should be run inside the muon collider software container, using the version of software you are working with.

### Build Instructions
Run the following commands from inside your container. The same commands will also work with a local installation of the ILC and Key4Hep software, with the exception of the first line.
```bash
source setup.sh
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install 
cmake --build . -t install
```
