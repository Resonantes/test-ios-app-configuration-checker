# iOS Test - App Configuration Checker

iOS exercice

* Created by [Resonantes](https://www.resonantes.fr/)

## But de l'exercice

Le but de l'exercice est d'implémenter la logique du premier écran de l'application, l'écran `Welcome`.

Cette logique doit :

  1. Récupérer des informations de configuration de l'application depuis un web service et vérifier si une mise à jour de l'application est nécessaire
  2. Rediriger l'utilisateur vers l'écran de login ou vers la Home de l'application en fonction de l'existence ou non d'une session utilisateur

L'objectif est d'estimer votre capacité à résoudre un problème métier en utilisant le langage Swift et le framework iOS. L'application doit fonctionner sur téléphone et simulateur. 

Durant l'entretien de debriefing nous reviendrons sur vos choix techniques. Une attention particulière sera apportée à l'organisation du code. Vous devez penser au support à long terme de votre application. 

### Version checker - Vérification de la configuration

La première étape de nécessite de récupérer les informations de configuration de l'application et de les comparer avec la version de l'application exécutée. 

La récupération de la configuration de l'application se fait en appelant le web service à l'adresse suivante : `https://api.alpha.app-elles.fr/v5/app`

Voici la requête curl permettant d'obtenir les informations de configuration pour l'application iOS.

```
curl --location --request GET 'https://api.alpha.app-elles.fr/v5/app' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--header 'AppElles-FromMobile: ios' \
--data-raw ''
```

La réponse obtenue est de la forme :

```
{
    "lastVersion": "100",
    "minVersion": "85",
    "url": "https://apps.apple.com/us/app/app-elles/id1458360794"
}
```

`lastVersion` : correspond au numéro de build de la version la plus récente en production.
`minVersion` : correspond au numéro de build de la version la plus ancienne autorisée à être exécutée.
`url` : correspond à l'URL du store permettant de mettre à jour l'application. Attention l'URL renvoyée ici est l'URL correspondant à la page App Store de l'application App-Elles. Cette page ne permet donc pas de mettre à jour l'application de test (ce n'est pas le but de l'exercice).

La première partie de l'exercice consiste à récupérer ces informations de configuration, de déterminer si l'application exécutée est à jour et de l'indiquer à l'utilisateur.

  * Si l'application est à jour, l'exécution se poursuit
  * Si une mise à jour existe mais qu'elle n'est pas obligatoire, une alerte propose à l'utilisateur d'ouvrir la page du magasin d'applications pour mettre à jour l'application. L'utilisateur peut ignorer cette suggestion.
  * Si une mise à jour existe et qu'elle est obligatoire (minVersion > build number), une alerte demande à l'utilisateur d'ouvrir la page du magasin d'applications pour mettre à jour l'application. L'utilisateur ne peut pas ignorer cette alerte.

### Redirection vers les pages Login ou Home

Si l'application est à jour, l'exécution se poursuit pour déterminer si l'utilisateur doit être redirigé vers la page de `Login` ou vers la page `Home`. Pour cela il convient d'interroger l'objet `Session` afin de déterminer si un utilisateur est déjà connecté ou non.

Pour tester votre implémentation, les classe `SessionWithUser` et `SessionWithoutUser` sont fournies.

```
private let session: Session = SessionWithUser()
// Switch between the two Session object to test your logic
//private let session: Session = SessionWithoutUser()
```

Si l'utilisateur existe, alors la page `Home` doit être affichée. Autrement la page `Login`doit être affichée. 

## FAQ

**L'adresse de mise à jour de l'application ne correspond pas à l'application de l'exercice**

Oui, l'URL renvoyée ici est l'URL correspondant à la page App Store de l'application App-Elles. Cette page ne permet donc pas de mettre à jour l'application de test (ce n'est pas le but de l'exercice).

**Peut-on utiliser des libraires pour cette exercice ?**

Vous être libre d'utiliser les librairies de votre choix pour réaliser cet exercice.


