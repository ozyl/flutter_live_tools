extension KotlinStuff<T> on T {
  R? as<R>() => this is R ? this as R : null;

  R let<R>(R Function(T) block) => block(this);

  T also(Function(T) block) {
    block.call(this);
    return this;
  }
}