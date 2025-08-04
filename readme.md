# paraview-user

Build up paraview-user image and container with graphic capabilities from paraview-base image

- Python 3.11.13
- ParaView 6.0.0

## Docker Images

```text
python:3-11-13-bookworm (official)
  | Debian 12 (Bookworm)
  | Python 3.11.13
  |     
paraview-base ---------- paraview-user
  | ParaView 6.0.0           graphic capabilities
  |   buid with                default UID: 1000
  | Python 3.11.13                     GID: 1000
  |
openfoam-base ---------- openfoam-user
  | Gnupot 5.4                 graphic capabiliteis
  | OpenFOAM 2506              default UID:1000
  | PyFOAM 2023.7                      GID:1000
  | JupyterLab 4.4.4
  | 
  |
```

## Hosts (my test machines)

Ubuntu (NVIDIA GPU)

- Ubuntu 24.04.2 LTS
- nvidia-container-toolkit 1.17.8-1 amd64
- Docker 28.3.1
- Docker Compose v2.38.1
- git 2.43.0

Windows11

- Ubuntu 24.04.1 LTS (WSL2)
- Docker for Windows 4.43.1
  (Setting > Resources > WSL  integration > Ubuntu 24.04: on)
- Windows Terminal 1.22.1111.0
- Git for Windows

## Settings

### UID and GID

Get user and group ID on Ubuntu (WSL2) terminal.

```bash
$ id -u
1000
$ id -g
1000
```

Edit user and group IDs of Dockerfile to match with host.

```docker
ARG Uid=1000
ARG Gid=1000
```

Edit docker-compose.yml or docker-composer-win.yml

"user: \<user ID\>:\<group ID\>"

```yml
  user: 1000:1000
```

### Mount point of host

Edit docker-compose.yml or docker-compose-win.yml.

workspace. Default is ${HOME}/workspace.

```yml
 - ${HOME}/workspace:/home/developer/workspace
```

## Build up the Image and Container

### Ubuntu

```bash
docker compose up -d --build
docker exec -it paraview-user bash
```

input

```bash
paraview
```

### Windows11

Use ubuntu (WSL) terminal (not power shell terminal)

```bash
docker compose -f docker-compose-win.yml up -d --build
docker exec -it paraview-user bash
```

input

```bash
paraview
```

## Stop and Remove the Container

```bash
docker compose down
```

## Reference

- [UbuntuにNVIDIA DriverとCUDA, Dockerをインストールして機械学習サーバを構築する](https://zenn.dev/mjun0812/articles/3694944ed3a588)
- [WSL2上のコンテナからWSLgを使用する](https://zenn.dev/holliy/articles/51012ef059aa9f)
- [wslのDockerでGUI操作](https://qiita.com/rayfiyo/items/17842dcf258b4d585531)
- [WSLg を使って Docker 上で GUI アプリを動かす（GPUサポート付き）](https://blog.mohyo.net/2022/02/11591/)
