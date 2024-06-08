# Synthetic-Speech-Data-Generation

1. **Library Importation:**
   - `library(audio)`: Loads a library for basic audio handling in R, which may include functionality to play back or record audio.
   - `library(phonTools)`: Incorporates a collection of tools for phonetics in R, including functions to synthesize vowel sounds.
   - `library(tuneR)`: Utilizes this package to manipulate and analyze audio files, notably to write audio data to files in various formats.

2. **Noise Generation:**
   - `noise1 = rnorm(5000, 0, 0.05) * 0.2`: This line creates a vector of 5000 samples of normally distributed random noise with a mean of 0 and a standard deviation of 0.05. The noise is then scaled down by a factor of 0.2 to reduce its amplitude, making it less prominent in the audio mix.

3. **Vowel Synthesis:**
   - `vowel1` and `vowel2` are generated using the `vowelsynth` function from the `phonTools` package, which synthesizes vowel sounds based on specified acoustic properties:
     - `ffs`: The formant frequencies, which are critical in determining the vowel sound's quality. Two formant frequencies are specified for each vowel, influencing how the vowel sounds.
     - `fbw`: Formant bandwidths, which affect the sharpness of the formants.
     - `dur`: Duration of the vowel sound in milliseconds.
     - `f0`: The fundamental frequency, or pitch, of the vowel.
     - `fs`: The sampling frequency, which is the rate at which the sound is digitally sampled.
     - `verify`: Set to `FALSE` to skip any graphical verification of the sound's spectrum.
     - `returnSound`: Also set to `FALSE`, likely implying the function doesn't return the sound object directly but influences the global sound settings or is used in conjunction with other functions.
     - `noise1` and `noise2`: Additional parameters controlling the amount of noise added to the synthetic vowel sound.

4. **Combining Audio Components:**
   - The vector `vowels` combines the noise and vowel sounds in a specific order: noise, first vowel, noise, second vowel, and ending with noise. This arrangement is typical for psychoacoustic tests or demonstrations where the listener's response to different sounds is evaluated in a controlled acoustic environment.

5. **Writing to an Audio File:**
   - `writesound(vowels, filename = "vowelpairs.wav", fs = 10000)`: This function from the `tuneR` library saves the combined audio data to a WAV file named "vowelpairs.wav". The specified sampling frequency is 10000 Hz, which is adequate for capturing the frequency range of human speech without excessive data.
