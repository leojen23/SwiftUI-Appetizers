
import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
   
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListItem(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                    }
                    .navigationTitle("🌮 Appetizers" )
                    .disabled(viewModel.isShowingDetail ? true : false)
                }
                .onAppear {
                    viewModel.getAppetizers()
                }
                .blur(radius: viewModel.isShowingDetail ? 15 : 0)
                
                if viewModel.isLoading {
                    LoadingView()
                }
        
            if viewModel.isShowingDetail {
                    AppetizerDetailView(
                        appetizer: viewModel.selectedAppetizer!,
                        isShowingDetailView: $viewModel.isShowingDetail)
                }
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
    


#Preview {
    AppetizerListView()
}



