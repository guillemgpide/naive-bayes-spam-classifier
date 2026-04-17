# Naive Bayes SMS Spam Classifier

[![Language](https://img.shields.io/badge/Language-MATLAB-blue.svg)](#)
[![Algorithm](https://img.shields.io/badge/Algorithm-Naive_Bayes-green.svg)](#)
[![Domain](https://img.shields.io/badge/Domain-NLP-orange.svg)](#)

> A Machine Learning project that implements a Naive Bayes probabilistic classifier from scratch in MATLAB to categorize SMS text messages as either 'SPAM' or 'HAM' (legitimate).

## 🚀 Overview

This repository contains the implementation of a Natural Language Processing (NLP) pipeline. It reads a dataset of text messages, extracts key features (word frequencies, probability distributions), and applies the Naive Bayes theorem to predict whether an unseen message is spam.

**Key Features:**
* **Custom Implementation:** Algorithm built from scratch without relying on pre-built Machine Learning toolboxes.
* **Feature Extraction:** Custom logic to separate texts, tokenize words, and build a frequency dictionary (`filtreClave_b.m`).
* **Prior & Conditional Probabilities:** Mathematical calculation of $P(Spam)$ and $P(Word|Spam)$ to compute the final likelihood.
* **Accuracy Evaluation:** Includes testing scripts to evaluate the model's accuracy on a holdout dataset.

## 📁 Repository Structure

* `src/`: Contains all the MATLAB core scripts (`.m` files).
  * `P3_b.m`: Main execution script with the optimized pipeline.
  * Helper functions (`separaHamSpam_b.m`, `carregaDades.m`, etc.) for data preprocessing and calculation.

## ⚙️ Quick Start

1. Clone the repository:

    git clone https://github.com/yourusername/naive-bayes-spam-classifier.git

2. Open MATLAB and navigate to the `src/` directory.
3. Ensure the dataset (`smssspamcollection`) is placed in the correct path relative to the loading script.
4. Run `P3_b.m` in the MATLAB Command Window to train the model and view the accuracy results.

## 📊 Results & Optimizations

*Note: The baseline implementation achieves standard accuracy, while the optimized scripts (`_b` suffix) implement improved filtering strategies (e.g., stopping words removal, length weighting) to push the accuracy above the 90% threshold on the test set.*
