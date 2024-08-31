FROM quay.io/keycloak/keycloak:25.0.4 as builder

WORKDIR /opt/keycloak
ENV KC_DB=mysql
ENV KC_HEALTH_ENABLED=true
ENV KC_CACHE_STACK=kubernetes

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:25.0.4
ENV KC_DB=mysql
ENV KC_HEALTH_ENABLED=true
ENV KC_CACHE_STACK=kubernetes

COPY --from=builder /opt/keycloak/ /opt/keycloak/