# iOS Test - App Configuration Checker

iOS exercice

* Created by [Resonantes](https://www.resonantes.fr/)

## But de l'exercice

Le but de l'exercice est d'implémenter sur l'écran Welcome la logique du premier écran de l'application.

Cette logique doit :

  1. Récupérer des informations de configuration de l'application depuis un web service et vérifier si une mise à jour de l'application est nécessaire
  2. Rediriger l'utilisateur vers l'écran de login ou vers la Home de l'application en fonction de l'existance ou non d'une session utilisateur

L'objectif est d'estimer votre capacité à résoudre un problème métier en utilisant le language Swift et le framework iOS. L'application doit fonctionner sur téléphone et simulateur.

Durant l'entretien de debriefing nous reviendrons sur vos choix technique. Une attention particulière sera apportée à l'organisation du code. Vous devez penser au support à long terme de votre application.

### Version checker - Verification de la configuration

La première étape de nécessite de récupérer les informations de configuration de l'application et de les comparer avec la version présente sur le téléphone de l'utilisateur. 

La récupération de la configuration de l'application se fait en appelant le web service à l'adresse suivante : `https://api.app-elles.fr/v5/app`

Voici la requête curl permattant d'obtenir les information de configuration pour l'application iOS.

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
`url` : correspond à l'URL du store permettant de mettre à jour l'application.

La première partie de l'exercice consiste à récupérer ces informations de configuration, de déterminer si l'application présente sur le téléphone est à jour et de l'indiquer à l'utilisateur.

  * Si l'application est à jour, l'éxécution se poursuit
  * Si une mise à jour existe mais qu'elle n'est pas obligatoire, une alerte propose à l'utilisateur d'ouvrir le store pour mettre à jour l'application. L'utilisateur peut ignorer cette suggestion.
  * Si une mise à jour existe et qu'elle est obligatoire (minVersion > build number), une alerte demande à l'utilisateur d'ouvrir le store pour mettre à jour l'application. L'utilisateur ne peut pas ignorer cette alerte.

### Redirection Login ou Home

Si l'application est à jour, l'éxécution se pousuit pour déterminer si l'utilisateur doit être redirigé vers la page de `Login` ou vers la page `Home`. Pour cela il conveint d'interroger l'objet `Session` afin de déterminer si un utilisateur existe ou non.

Pour tester votre implémentation, les classe `SessionWithUser` et `SessionWithoutUser` sont fournies.

```
private let session: Session = SessionWithUser()
// Switch between the two Session object to test your logic
//private let session: Session = SessionWithoutUser()
```

Si l'utilisateur existe, alors la page `Home` doit être affichée. Autrement la page `Login`doit être affichée. 

## FAQ

**L'adresse de mise à jour de l'application ne correspon pas à l'application de l'exercice**

Oui, l'URL du store est l'URL de la page store de App-Elles. Durant le développement de l'application il vous faudra simuler les différentes configurations.

**Peut-on utiliser des libraires pour cette exercice ?**

Vous être libre d'utiliser les librairies de votre choix pour réaliser cette exercice.


