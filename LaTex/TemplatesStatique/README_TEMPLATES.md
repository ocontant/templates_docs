# Guide d'Utilisation des Templates LaTeX Modulaires Dollarama

Ce guide explique comment utiliser les templates LaTeX modulaires pour créer des business cases professionnels avec l'identité visuelle de Dollarama.

## 📁 Structure des Fichiers

### Templates de Base
- **`dollarama_template.tex`** - Template principal avec branding, couleurs et logo officiel
- **`document_elements_template.tex`** - Éléments stylisés (tables, citations, figures, espacement)

### Sections Modulaires
- **`section_executive_summary.tex`** - Résumé exécutif avec métriques clés
- **`section_financial_analysis.tex`** - Analyse financière complète avec ROI et VAN
- **`section_risk_assessment.tex`** - Matrices de risques et plans de mitigation
- **`section_implementation_timeline.tex`** - Calendrier détaillé avec jalons et ressources
- **`section_appendices.tex`** - Annexes techniques et spécifications

### Templates Prêts à Utiliser
- **`document_structure_template.tex`** - Document complet utilisant tous les modules
- **`master_template.tex`** - Template alternatif avec structure différente

## 🚀 Méthodes d'Utilisation

### Méthode 1: Sans Copier les Templates (Recommandée)

Créez votre document dans le répertoire principal et référencez les templates:

```latex
% mon_document.tex
\input{TemplateStatique/dollarama_template}
\input{TemplateStatique/document_elements_template}

\begin{document}
% Votre contenu personnalisé
\input{TemplateStatique/section_executive_summary}
\input{TemplateStatique/section_financial_analysis}
\end{document}
```

### Méthode 2: Copier Seulement le Template Principal

```bash
# Copier uniquement le template de structure
cp TemplateStatique/document_structure_template.tex mon_business_case.tex

# Le fichier copié référencera automatiquement les autres templates
# depuis le dossier TemplateStatique/
```

### Méthode 3: Document Minimal

```latex
% document_minimal.tex
\input{TemplateStatique/dollarama_template}

\begin{document}
\dollaramalogo[0.6]
\section{Mon Projet}
% Contenu simple

% Inclure seulement les sections nécessaires
\input{TemplateStatique/section_financial_analysis}
\end{document}
```

## 🔧 Compilation

### Prérequis Système

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install texlive-full inkscape
```

**macOS:**
```bash
brew install --cask mactex
brew install inkscape
```

**Windows:**
- Installer MiKTeX ou TeX Live
- Installer Inkscape

### Commandes de Compilation

**Depuis le répertoire principal (Template_Latex/):**
```bash
pdflatex -shell-escape mon_document.tex
pdflatex -shell-escape mon_document.tex  # Deux fois pour les références
```

**Avec un script de compilation:**
```bash
#!/bin/bash
# compile.sh
pdflatex -shell-escape $1.tex
pdflatex -shell-escape $1.tex
rm -f *.aux *.log *.out *.toc *.lof *.lot
echo "Compilation terminée: $1.pdf"
```

## 📊 Personnalisation du Contenu

### Remplir les Placeholders

Les templates contiennent des placeholders entre crochets:
- `[Nom du projet]` - Remplacez par votre nom de projet
- `[Montant]` - Remplacez par vos montants
- `[Date]` - Remplacez par vos dates
- `[Description]` - Remplacez par vos descriptions

### Exemple de Personnalisation

**Avant:**
```latex
\textbf{Investissement requis :} \$[Montant total de l'investissement initial]
```

**Après:**
```latex
\textbf{Investissement requis :} \$250,000
```

## 🎨 Éléments Stylisés Disponibles

### Boîtes d'Information
```latex
\highlightbox{Contenu important à mettre en évidence}
\infobox{Information générale pour le lecteur}
\warningbox{Avertissement ou point d'attention}
```

### Citations
```latex
\citecourt{REF1}{Description courte de la référence}
\citelong{REF2}{Auteur}{2024}{Titre complet du document}
\citeinterne{DOC-001}{2024}{Document interne Dollarama}
```

### Espacement
```latex
\vspacelarge    % Grand espacement vertical
\hspacemedium   % Espacement horizontal moyen
\vseparator     % Séparateur décoratif
```

## 🔍 Dépannage

### Erreurs Communes

**Erreur: "File not found"**
- Vérifiez que vous compilez depuis le bon répertoire
- Les chemins doivent pointer vers `TemplateStatique/`

**Erreur: "Undefined control sequence"**
- Assurez-vous d'inclure `\input{TemplateStatique/dollarama_template}` en premier

### Structure de Répertoire Requise
```
Template_Latex/
├── TemplateStatique/
│   ├── dollarama_template.tex
│   ├── section_*.tex
│   └── dollarama-official-logo.svg
└── mon_document.tex
```

## 💡 Bonnes Pratiques

1. **Ne modifiez pas les fichiers dans TemplateStatique/** - Ils sont réutilisables pour tous les projets
2. **Créez vos documents dans le répertoire parent** - Cela simplifie les chemins
3. **Utilisez les placeholders** - Remplacez tous les `[...]` par vos données
4. **Compilez deux fois** - Pour les références et la table des matières
5. **Gardez le logo SVG dans TemplateStatique/** - Il sera automatiquement trouvé

## 📚 Exemples d'Utilisation

### Business Case Complet
```latex
\input{TemplateStatique/dollarama_template}
\input{TemplateStatique/document_elements_template}
\begin{document}
% Toutes les sections
\input{TemplateStatique/section_executive_summary}
\input{TemplateStatique/section_financial_analysis}
\input{TemplateStatique/section_risk_assessment}
\input{TemplateStatique/section_implementation_timeline}
\input{TemplateStatique/section_appendices}
\end{document}
```

### Analyse Financière Seulement
```latex
\input{TemplateStatique/dollarama_template}
\begin{document}
\section{Analyse du Projet X}
% Introduction personnalisée
\input{TemplateStatique/section_financial_analysis}
\end{document}
```

### Document Exécutif Court
```latex
\input{TemplateStatique/dollarama_template}
\begin{document}
\input{TemplateStatique/section_executive_summary}
% Conclusions personnalisées
\end{document}
```

## 🔄 Workflow Recommandé

1. **Créer votre fichier .tex** dans le répertoire principal
2. **Inclure les templates de base** avec `\input{TemplateStatique/...}`
3. **Ajouter les sections modulaires** selon vos besoins
4. **Remplacer les placeholders** par vos données
5. **Compiler** avec `pdflatex -shell-escape`
6. **Vérifier le PDF** et ajuster au besoin

---

*Les templates restent dans le dossier TemplateStatique/ et peuvent être utilisés pour plusieurs projets sans duplication.*