# Time Series Comparison

Mining and comparing time series address a large range of challenges, among them: the meaningfulness of the distance, similarity and dissimilarity measures. They are widely used in many research areas and applications. Distances or (dis)similarity measures are essential to solve many signal processing, image processing and pattern recognition problems such as classification, clustering, and retrieval problems. Various distances, similarity and dissimilarity measures that are applicable to compare time series, are presented over the past decade. The major well-known measures have been grouped into two categories: value-based and behavior-based metrics.

Value-based metrics:
A first way to compare time series data involves concept of values and distance metrics, where time series are compared according to their values. This subsection relies on two standard well-known division: (a) without considering delays (e.g. Minkowski distance) and (b) with delays (e.g. Dynamic Time Warping).

Behavior-based metrics:
The second category of time series metrics concerns behavior-based metrics, where time series are compared according to their behaviors regardless of their values. That is the case when time series of a same class exhibit similar shape or behavior, and time series of different classes have different shapes. Hence, comparing the time series on the base of their value may not be valid assumption. In this context, we should define which time series are more similar together and which ones are different. 


Most of the time, two time series sharing same configuration are considered close, eventhough they have very different values, and vice-versa. Hence, choosing a proper metric can be crucial and very important for the time series comparison. In some cases, several behavior and value-based metrics may be implied. Some propositions show the benefit of involving both behavior and value-based metrics through a combination function. Therefore, to compare the time series and define a proximity measure covering both the behaviors and values components, a weighted linear (or geometric) function combines behavior and value-based metrics.

On the other hand, a time series may be considered in the spectral representations, which means the time series may be similar because they share the same frequency characteristics. Hence, in some application, the frequential-based metrics (e.g. wavelet transforms, fourier transforms) will be used.
