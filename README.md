# Health Check Automation - Bash

## 🎯 Objetivo

Este projeto tem como objetivo aplicar, de forma prática e incremental, conceitos de automação operacional utilizando Bash.

O script realiza verificações automatizadas de disponibilidade de serviços e endpoints HTTP, simulando cenários reais de ambientes DevOps/SRE, com foco em confiabilidade, prevenção de falhas e boas práticas operacionais.

---

## 🚀 Versão Atual

### v1.0 – Verificação HTTP básica

Funcionalidades implementadas:

- Requisição HTTP utilizando `curl`
- Validação de status HTTP (200 como sucesso)
- Geração de log com timestamp
- Retorno de exit code apropriado:
  - `exit 0` → sucesso
  - `exit 1` → falha

---

## 🧠 Conceitos Aplicados

- Shell Script (Bash)
- Controle de fluxo (`if`)
- Variáveis
- Exit codes
- Automação de verificação de disponibilidade
- Logging básico

---

## 📂 Estrutura do Projeto

- `health_check.sh` → Script principal
- `health_check.log` → Arquivo de log gerado em tempo de execução (ignorado pelo Git)
- `.gitignore` → Arquivos que não devem ser versionados

---

## 🔄 Evolução Planejada

Este projeto será evoluído incrementalmente conforme avanço nos estudos de DevOps/SRE.

Próximas implementações previstas:

- Verificação de serviço via `systemctl`
- Retry automático
- Log rotativo
- Integração com `cron`
- Integração com CI/CD
- Evolução futura com Docker

Cada evolução será versionada por tag, mantendo histórico claro das melhorias implementadas.

---

## 📌 Objetivo de Aprendizado

Simular, de forma progressiva, práticas próximas a ambientes reais de produção, reforçando:

- Mentalidade de confiabilidade
- Automação preventiva
- Estruturação de scripts para uso em pipelines
- Versionamento e evolução incremental

---

## 👩‍💻 Autora

Helena Oliveira Silva  
DevOps | SRE | Automação
