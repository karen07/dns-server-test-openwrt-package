# dns-server-test OpenWrt package

OpenWrt packaging for [dns-server-test](https://github.com/karen07/dns-server-test), a
cache-backed DNS replay server. It installs the server binary on OpenWrt.

## Описание

Пакет OpenWrt для [dns-server-test](https://github.com/karen07/dns-server-test) - тестового
DNS-сервера, воспроизводящего ответы из локального кеша. Устанавливает исполняемый файл
сервера на OpenWrt.

Пакет устанавливает бинарный файл `dns-server-test` в `/usr/bin` и не объявляет дополнительных зависимостей времени выполнения OpenWrt.

При разработке Makefile может собирать исходники из соседнего каталога `../dns-server-test`. Если такого каталога нет, OpenWrt загружает версию исходников по тегу, заданному в `PKG_VERSION`.

## Структура проекта

- `dns-server-test/Makefile` - описание OpenWrt package;
- `openwrt-build.env` - параметры пакета для общего CI;
- `.github/workflows/openwrt-build.yml` - вызов общего reusable workflow.

## Сборка

Сборка выполняется через GitHub Actions. Workflow этого репозитория вызывает общий reusable workflow из [openwrt-package-ci](https://github.com/karen07/openwrt-package-ci).

CI можно запустить:

- push тега вида `vX.Y.Z` - значение тега используется как версия OpenWrt;
- вручную через `workflow_dispatch`, указав версию OpenWrt и при необходимости фильтры target/subtarget.

Параметры этого пакета хранятся в `openwrt-build.env`. Общие `openwrt-build.sh`, `openwrt-matrix.py` и логика сборки через OpenWrt SDK находятся в `openwrt-package-ci`.

Для ручной сборки каталог `dns-server-test/` можно использовать как обычный package directory внутри OpenWrt buildroot/SDK.

## Связанные проекты

- [dns-server-test](https://github.com/karen07/dns-server-test) - основной проект, исходный код и описание формата `cache.data`.
