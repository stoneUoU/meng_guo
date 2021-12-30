import 'package:meng_guo/function/message/viewmodel/message_view_model.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class MessageChildViewModel extends BaseViewModel {
  MessageChildViewModel(BaseModel model) : super(model);

  MessageViewModel? parentViewModel;

  void initParentViewModel(MessageViewModel parentViewModel) {
    this.parentViewModel = parentViewModel;
    this.hideStateToolBar = true;
  }

  @override
  void onReloadData() {
    super.onReloadData();
    if (parentViewModel != null) {
      parentViewModel?.onReloadData();
    }
  }

  // @override
  // void showEmpty() {
  //   // TODO: implement showEmpty
  //   super.showEmpty();
  // }
}
