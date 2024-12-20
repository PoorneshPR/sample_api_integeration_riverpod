import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/riverpod/passenger/passenger_provider.dart';
import 'package:sample_riverpod/riverpod/passenger/passenger_state.dart';

class PassengerView extends ConsumerStatefulWidget {
  const PassengerView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PassengerDetailViewState();
}

class _PassengerDetailViewState extends ConsumerState<PassengerView> {
  final passengerProvider = NotifierProvider<PassengerProvider, PassengerState>(
      PassengerProvider.new);

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(passengerProvider.notifier)
          .getPassengers(enableLoaderState: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loaderState =
    ref.watch(passengerProvider.select((value) => value.loaderState));
    final enableLoaderState =
    ref.watch(passengerProvider.select((value) => value.enableLoaderState));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passenger"),
      ),
      body: SwitchView(
          loaderState: loaderState,
          enableLoaderState: enableLoaderState,
          loadedView: PassengerLoadedView(provider: passengerProvider)),
    );
  }
}

class SwitchView extends StatelessWidget {
  final LoaderState? loaderState;
  final Widget? loadedView;
  final bool? enableLoaderState;
  const SwitchView(
      {Key? key, this.loaderState, this.loadedView, this.enableLoaderState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("Switch View Builds");
    if (enableLoaderState ?? true) {
      switch (loaderState) {
        case LoaderState.loaded:
          return loadedView ?? const SizedBox();
        case LoaderState.loading:
          return const Center(child: CircularProgressIndicator());
        case LoaderState.error:
          return const Center(child: Text("Error"));
        default:
          return const SizedBox();
      }
    } else {
      return loadedView ?? const SizedBox();
    }
  }
}

class PassengerLoadedView extends ConsumerStatefulWidget {
  final NotifierProvider<PassengerProvider, PassengerState> provider;
  const PassengerLoadedView({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PassengerLoadedViewState();
}

class _PassengerLoadedViewState extends ConsumerState<PassengerLoadedView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      pagination();
    });
  }

  void pagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(widget.provider.notifier).getPassengers(
            enableLoaderState: false,
            page: ref.read(widget.provider.notifier).pageCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final passenger =
        ref.watch(widget.provider.select((value) => value.passengersList));
    final loaderState =
        ref.watch(widget.provider.select((value) => value.loaderState));
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            final item = passenger?.elementAt(index);
            return Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              margin: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(item?.name ?? ""),
                      Expanded(
                          child: Text("ID : ${item?.id ?? ""}",
                              textAlign: TextAlign.end)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("Trips : ${item?.trips?.toString() ?? ""}"),
                ],
              ),
            );
          }, childCount: passenger?.length),
        ),
        SliverToBoxAdapter(
          child: SizedBox.square(
            dimension: 50,
            child: (loaderState == LoaderState.loading)
                ? const SizedBox.square(
                    dimension: 25,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        )
      ],
    );
  }
}
