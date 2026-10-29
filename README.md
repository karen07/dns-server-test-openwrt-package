# DNS Server Test OpenWrt Package

OpenWrt packaging for [dns-server-test](https://github.com/karen07/dns-server-test), a
cache-backed DNS replay server. It installs the server binary on OpenWrt.

Пакет OpenWrt для [dns-server-test](https://github.com/karen07/dns-server-test) - тестового
DNS-сервера, воспроизводящего ответы из локального кеша. Устанавливает исполняемый файл
сервера на OpenWrt.

## Описание

Пакет устанавливает бинарный файл `dns-server-test` в `/usr/bin` и не объявляет дополнительных зависимостей времени выполнения OpenWrt.

При разработке Makefile может собирать исходники из соседнего каталога `../dns-server-test`. Если такого каталога нет, OpenWrt загружает версию исходников по тегу, заданному в `PKG_VERSION`.

## Разработка и проверка изменений

**Основные точки изменения:**

- `dns-server-test/Makefile` - зависимости, версия и правила установки (DNS-сервер);
- `openwrt-build.env` - параметры сборки для общего CI;
- `.github/workflows/openwrt-build.yml` - вызов переиспользуемого OpenWrt workflow.

**Выбор исходников и артефакт пакета:** `dns-server-test/Makefile` берёт соседний каталог `dns-server-test` при наличии его `CMakeLists.txt`; иначе получает Git-тег `v$(PKG_VERSION)` основного проекта. Пакет устанавливает бинарник в `/usr/bin/dns-server-test`. При проверке релиза отличайте сборку локальных исходников от сборки по тегу и сверяйте `PKG_VERSION` с нужной ревизией. Проверьте путь к кешу и совместимость его формата с `dns-client-test`.

**Проверка изменений:** Изменения функциональности: формат кеша и обработка запросов изменяются в отдельном `dns-server-test`. Для упаковки проверяйте `Makefile`, `openwrt-build.env` и CI вместе; тестируйте итоговый пакет на нужной версии OpenWrt, поскольку сборка приложения сама по себе не проверяет установку и зависимости.

## Сборка

Сборка выполняется через GitHub Actions. Workflow этого репозитория вызывает общий reusable workflow из [openwrt-package-ci](https://github.com/karen07/openwrt-package-ci).

CI можно запустить:

- push тега вида `vX.Y.Z` - значение тега используется как версия OpenWrt;
- вручную через `workflow_dispatch`, указав версию OpenWrt и при необходимости фильтры target/subtarget.

Параметры этого пакета хранятся в `openwrt-build.env`. Общие `openwrt-build.sh`, `openwrt-matrix.py` и логика сборки через OpenWrt SDK находятся в `openwrt-package-ci`.

Для ручной сборки каталог `dns-server-test/` можно использовать как обычный package directory внутри OpenWrt buildroot/SDK.

## Структура проекта

- `dns-server-test/Makefile` - описание OpenWrt package;
- `openwrt-build.env` - параметры пакета для общего CI;
- `.github/workflows/openwrt-build.yml` - вызов общего reusable workflow.

## Связанные проекты

- [dns-server-test](https://github.com/karen07/dns-server-test) - основной проект, исходный код и описание формата `cache.data`.

## Лицензия

Проект распространяется под лицензией GNU Affero General Public License v3.0. Подробности см. в файле [LICENSE](LICENSE).
