# Système de Templates Paramétriques Dollarama

Ce système avancé permet de créer des documents professionnels Dollarama en utilisant des **classes LaTeX** et des **packages paramétriques**. Aucune modification des templates n'est nécessaire - tout est configurable via des paramètres.

## 🎯 Philosophie du Système

**Séparation complète du style et du contenu:**
- **Style et structure** → Définis dans les templates (classes/packages)
- **Contenu** → Défini dans vos documents via des paramètres
- **Aucune modification** des fichiers templates requis

## 📁 Structure du Système

```
TemplatesParametriques/
├── dollarama.cls                    # Classe principale avec branding
├── dollarama-business.sty           # Commandes business paramétriques
├── dollarama-layouts.sty            # Environnements et layouts modulaires
├── dollarama-official-logo.svg     # Logo officiel
└── README_SYSTEME_PARAMETRIQUE.md  # Cette documentation
```

## 🚀 Utilisation de Base

### 1. Document Simple

```latex
\documentclass{TemplatesParametriques/dollarama}
\usepackage{TemplatesParametriques/dollarama-business}

% Configuration des métadonnées
\title{Mon Projet}
\author{Jean Dupont}
\department{IT}

\begin{document}
\maketitle

% Résumé exécutif paramétrable
\executivesummary{Problème}{Solution}{Bénéfices}{Impact financier}{Recommandation}

\end{document}
```

### 2. Document Avancé avec Layouts

```latex
\documentclass{TemplatesParametriques/dollarama}
\usepackage{TemplatesParametriques/dollarama-business}
\usepackage{TemplatesParametriques/dollarama-layouts}

% Métadonnées avancées
\title{Transformation Digitale}
\subtitle{Phase 1: Modernisation}
\author{Marie Martin}
\department{Innovation}
\status{Final}
\version{2.0}
\classification{Confidentiel}

\begin{document}
\maketitle

% Sections structurées avec environnements
\begin{dollaramaintroduction}{Contexte général}
    Votre contenu d'introduction...
\end{dollaramaintroduction}

% Métriques financières
\keyfinancialmetrics{\$2.4M}{185\%}{12 mois}{\$800K/an}

\end{document}
```

## 🎨 Commandes Paramétriques Disponibles

### Résumé Exécutif

```latex
\executivesummary{
    {Problématique décrite}
    {Solution proposée}
    {Liste des bénéfices}
    {Impact financier}
    {Recommandation finale}
}
```

### Métriques Financières

```latex
\keyfinancialmetrics{VAN}{TRI}{Payback}{ROI}
% Exemple:
\keyfinancialmetrics{\$3.2M}{156\%}{18 mois}{\$1.2M/an}
```

### Tableau de Bord Projet

```latex
\projectdashboard{Durée}{Budget}{Jalons}{Équipes}
% Exemple:
\projectdashboard{12 mois}{\$2.5M}{8 jalons}{6 équipes}
```

## 🏗️ Environnements de Layout

### Tables Stylisées

```latex
% Table de coûts
\begin{dollaramacosttable}{Titre}{label}
    \costrow{Élément 1}{100}{\$50}{\$5,000}
    \altcostrow{Élément 2}{200}{\$75}{\$15,000}
    \totalrow{TOTAL}{20,000}
\end{dollaramacosttable}

% Table de flux de trésorerie
\begin{dollaramacashflowtable}{Titre}{label}
    Revenus & -\$100K & \$500K & \$600K & \$700K & \$800K & \$900K \\
    Coûts & \$0 & -\$200K & -\$210K & -\$220K & -\$230K & -\$240K \\
    \totalrow{Flux Net}{-100K vs 660K}
\end{dollaramacashflowtable}
```

### Sections Structurées

```latex
% Introduction avec contexte
\begin{dollaramaintroduction}{Contexte organisationnel}
    Votre analyse de la situation actuelle...
\end{dollaramaintroduction}

% Comparaison d'options
\begin{dollaramacomparison}{Titre}{Option A}{Option B}
    Contenu de l'option A...
\vscompare
    Contenu de l'option B...
\enddollaramacomparison}
```

### Processus et Timeline

```latex
% Processus étape par étape
\begin{dollaramaprocess}{Nom du processus}
    \processstep{Étape 1}{Description détaillée}
    \processstep{Étape 2}{Description détaillée}
    \processstep{Étape 3}{Description détaillée}
\end{dollaramaprocess}

% Timeline avec jalons
\begin{dollaramatimeline}{Vue d'ensemble}
    \milestone{Jan 2025}{Début projet}{Critères de démarrage}
    \milestone{Mar 2025}{Phase pilote}{Tests et validation}
    \milestone{Jun 2025}{Déploiement}{Rollout complet}
\end{dollaramatimeline}
```

## 🎨 Boîtes d'Information

```latex
\highlightbox{Information importante à mettre en évidence}
\infobox{Information générale pour contexte}
\warningbox{Avertissement ou point critique}
```

## 💰 Formatage Financier

```latex
\currency{2500}        % Affiche: $2500
\percentage{15.5}      % Affiche: 15.5%
\positive{1200}        % Affiche: +$1200 (vert)
\negative{800}         % Affiche: -$800 (rouge)
```

## 📊 Indicateurs de Risque

```latex
\risklow      % F (vert)
\riskmedium   % M (jaune)  
\riskhigh     % É (rouge)

\scorelow{3}     % Score 3 (vert)
\scoremedium{6}  % Score 6 (jaune)
\scorehigh{9}    % Score 9 (rouge)
```

## 📋 En-têtes de Tableaux Standardisés

```latex
% En-tête standard avec contraste amélioré (DollaramaGreen 80% + texte blanc)
\dollaramatabheader                    % Applique la couleur de fond
\dollaramatabheadertext{Nom colonne}   % Texte formaté blanc et gras

% En-tête alternatif (DollaramaYellow 90% + texte noir)
\dollaramatabheaderalt                 % Couleur de fond jaune
\dollaramatabheaderaltext{Nom colonne} % Texte formaté noir et gras

% En-tête critique (Rouge 80% + texte blanc)
\dollaramatabheadercritical            % Couleur de fond rouge
\dollaramatabheadertext{Nom colonne}   % Texte formaté blanc et gras

% Exemple d'utilisation
\begin{tabular}{|l|r|r|}
\hline
\dollaramatabheader
\dollaramatabheadertext{Élément} & 
\dollaramatabheadertext{Quantité} & 
\dollaramatabheadertext{Total} \\
\hline
Produit A & 100 & \$500 \\
\hline
\end{tabular}
```

## 🔧 Configuration Avancée

### Métadonnées de Document

```latex
\title{Titre principal}
\subtitle{Sous-titre optionnel}
\author{Nom de l'auteur}
\department{Département}
\status{Brouillon/Révision/Final}
\version{1.0}
\classification{Confidentiel - Usage interne}
```

### Espacement et Séparateurs

```latex
\vspacesmall    % Petit espacement vertical
\vspacemedium   % Espacement vertical moyen
\vspacelarge    % Grand espacement vertical

\dollaramaseparator  % Séparateur horizontal stylisé
\sectionseparator{Titre}  % Séparateur de section avec titre
```

## 📝 Exemple Complet

Voir `exemple_systeme_parametrique.tex` pour un exemple complet d'utilisation montrant:
- Page de titre automatique avec métadonnées
- Résumé exécutif paramétrable
- Sections avec layouts avancés
- Tables financières stylisées
- Processus et timeline visuels
- Gestion des risques colorée

## 🔄 Workflow Recommandé

1. **Commencez par la classe de base:**
   ```latex
   \documentclass{TemplatesParametriques/dollarama}
   ```

2. **Ajoutez les packages nécessaires:**
   ```latex
   \usepackage{TemplatesParametriques/dollarama-business}
   \usepackage{TemplatesParametriques/dollarama-layouts}
   ```

3. **Configurez les métadonnées:**
   ```latex
   \title{...}
   \author{...}
   \department{...}
   ```

4. **Utilisez les commandes paramétriques:**
   ```latex
   \executivesummary{...}{...}{...}{...}{...}
   \keyfinancialmetrics{...}{...}{...}{...}
   ```

5. **Compilez normalement:**
   ```bash
   pdflatex -shell-escape document.tex
   ```

## 🚀 Avantages du Système

✅ **Séparation style/contenu** - Aucune modification des templates
✅ **Réutilisabilité** - Même style pour tous les projets
✅ **Maintenance centralisée** - Mises à jour automatiques
✅ **Flexibilité** - Combinaison libre des éléments
✅ **Simplicité** - Paramètres clairs et documentés
✅ **Cohérence** - Style uniforme garanti

## 🔍 Comparaison avec l'Ancien Système

| Aspect | Ancien (Templates statiques) | Nouveau (Système paramétrique) |
|--------|-------------------------------|--------------------------------|
| Personnalisation | Copier et modifier | Paramètres dans le document |
| Maintenance | Modifications manuelles | Automatique via classes |
| Cohérence | Risque de divergence | Garantie par le système |
| Complexité | Moyenne | Faible |
| Flexibilité | Limitée | Très élevée |

---

*Ce système représente l'approche professionnelle moderne pour la création de documents d'entreprise avec LaTeX.*