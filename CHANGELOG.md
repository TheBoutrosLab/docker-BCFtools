# Changelog
All notable changes to the BCFtools Docker file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]
- Update BCFtools 1.22 to 1.23.1
- Update Ubuntu base image 23.04 to 25.04
- Switch the builder image from Mambaforge to Miniforge3 and update it from 24.7.1-2 to 26.1.1-2

## [1.22] - 2024-08-29
- Update BCFtools 1.21 to 1.22

## [1.21] - 2024-10-09
- Update BCFtools 1.20 to 1.21

## [1.20] - 2024-04-24
- Update BCFtools 1.19 to 1.20

## [1.19] - 2024-01-09
### Changed
- Update BCFtools 1.18 to 1.19


## [1.18] - 2023-10-18
### Changed
- Upgrade BCFtools 1.17 to 1.18

---

## [1.17] - 2023-05-08
### Added
- Add GitHub autobuild action
- Add LICENSE.md file to repo
- Add `License` section to README.md

### Changed
- Switch from `bl-base` to `condaforge`/`mambaforge`
- Upgrade BCFtools 1.15.1 to 1.17
- Upgrade BCFtools 1.15 to 1.15.1
- Upgrade bl-base 1.0.0 to 1.1.0
- Add `bldocker` as user in the Dockerfile

---

## [1.12] - 2021-04-29
### Added
- Migrated BCFtools dockerfile to its own repository
