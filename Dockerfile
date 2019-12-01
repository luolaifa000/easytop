# This my first nginx Dockerfile
# Version 1.0

# Base images 基础镜像
FROM registry.cn-hangzhou.aliyuncs.com/yumancang/nginx:lastest

#MAINTAINER 维护者信息
MAINTAINER yumancang laifaluo@126.com

ADD ./ /home/user00/web/
ADD ./docker_config/nginx.conf /etc/nginx/
ADD ./docker_config/easytop.conf /etc/nginx/conf.d/
ADD ./docker_config/docker-entrypoint.sh /home/user00/web/
RUN chown -R user00:user00 /home/user00
RUN chmod +x /home/user00/web/docker-entrypoint.sh

# 开放端口
EXPOSE 80

ENTRYPOINT /bin/bash /home/user00/web/docker-entrypoint.sh